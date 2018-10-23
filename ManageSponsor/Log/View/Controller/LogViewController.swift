//
//  LogViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import ViewAnimator
import Firebase

class LogViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var refresh : UIRefreshControl?
    var logViewModel : LoginViewModel?
    let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]

    let db = Firestore.firestore()

    lazy var logList = Array<LogModel>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultView()
        addRefresh()
        
    }
    
}
