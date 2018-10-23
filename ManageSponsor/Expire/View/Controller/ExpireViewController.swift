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


}
