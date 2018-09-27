//
//  TabbarViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 27..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    @IBInspectable var defaultIndex: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "setting"), style: .done, target: self, action: #selector(TabbarViewController.setting))
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func setting() {
        let st = self.storyboard?.instantiateViewController(withIdentifier: "Setting") as! SettingViewController
        self.navigationController?.pushViewController(st, animated: true)
    }
}
