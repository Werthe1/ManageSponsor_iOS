//
//  HomeViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSoup
import ViewAnimator
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    let db = Firestore.firestore()
    lazy var homelist = Array<HomeModel>()

    var refresh : UIRefreshControl?
    
    let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]
    let reload = Notification.Name(rawValue: saveClicked)

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
        defaultNavi()
        createObserver()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.reloadData), name: reload, object: nil)
    }
    
    func loadData() {
        db.collection("Schedule").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    print(document.data())
                    
                    self.homelist.append(HomeModel(name: document.data()["writer"] as! String, content: document.data()["content"] as! String, date: document.data()["date"] as! String, alert: document.data()["alert"] as! Int))
                    
                    self.tableView.reloadData()
                    
                }
            }
        }
    }
    
    @objc func reloadData(notification: NSNotification) {
        loadData()
    }
    
    @IBAction func writeButtonPressed(_ sender: Any) {

        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        write.modalPresentationStyle = .overCurrentContext
        self.present(write, animated: false, completion: nil)

    }
    
}
