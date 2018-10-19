//
//  LogViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array1 = ["이지윤님의이지윤님의이지윤님의이지윤님의이지윤님의이지윤님의이지윤님의 개인정보가 변경되었습니다.","김혜리님의 개인정보가 변경되었습니다.","홍길동님의 개인정보가 변경되었습니다."]
    
    var refresh : UIRefreshControl?
    var logViewModel : LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        addRefresh()
        
    }
    
}
