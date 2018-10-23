//
//  ExpireViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import ViewAnimator
import Firebase

class ExpireViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var refresh : UIRefreshControl?
    var exprieViewModel : ExprieViewModel?
    
    let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]
    var dat : String = ""
    let db = Firestore.firestore()
    
    lazy var exprieList = Array<ExprieDetailModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultView()
    }

    func loadData() {
    
        db.collection("Agreement").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    print(document.data())
                    
                    self.dat = "\(document.data()["startDate"] as! String) ~ \(document.data()["endDate"] as! String)"
                    
                    self.exprieList.append(ExprieDetailModel(sponsorName: document.data()["sponsorName"] as! String, startDate: document.data()["startDate"] as! String, payDay: document.data()["payDay"] as! Int, sponsorBirth: document.data()["sponsorBirth"] as! String, endDate: document.data()["endDate"] as! String, accountHolder: document.data()["accountHolder"] as! String, bankName: document.data()["bankName"] as! String, purpose: document.data()["purpose"] as! String, sponsorNum: document.data()["sponsorNum"] as! String, accountNo: document.data()["accountNo"] as! String, payMethod: document.data()["payMethod"] as! String, agreementId: document.data()["agreementId"] as! String, etc: document.data()["etc"] as! String, sponsorContact: document.data()["sponsorContact"] as! String, pay: document.data()["pay"] as! Int))
                    
                    self.tableView.reloadData()
                    
                }
            }
        }
        
    }
}
