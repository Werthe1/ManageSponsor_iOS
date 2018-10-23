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

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
        defaultNavi()
        
    }

    @IBAction func writeButtonPressed(_ sender: Any) {

        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        write.modalPresentationStyle = .overCurrentContext
        self.present(write, animated: false, completion: nil)

    }
    
}
