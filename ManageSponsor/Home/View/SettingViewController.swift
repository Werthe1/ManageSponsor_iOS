//
//  SettingViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 27..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "SwitchState")

        if sender.isOn {
            switchChanged(text: "설정")
        } else {
            switchChanged(text : "해제")
        }
    }
    
}
