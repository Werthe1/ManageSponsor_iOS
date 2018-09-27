//
//  HomeViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var array1 = ["성공회대 총장 취임식", "후원자의 밤", "후원인 달력 발송","소식지 발송"]
    var array2 = ["2018-10-09", "2019-01-10", "2018-12-01", "2018-11-17"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
        defaultNavi()
    }

    @IBAction func writeButtonPressed(_ sender: Any) {
        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        self.navigationController?.pushViewController(write, animated: false)
    }
}


