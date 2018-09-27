//
//  WriteViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {

    var theme = MyTheme.dark
    let calender = Notification.Name(rawValue: calenderClicked)
    @IBOutlet weak var calButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
        defaultNavigation()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
