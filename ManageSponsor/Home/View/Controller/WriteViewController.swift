//
//  WriteViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {

    let calender = Notification.Name(rawValue: calenderClicked)
    
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var calButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
//        defaultNavigation()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func clearButtonpressed(_ sender: Any) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.dismiss(animated: true, completion: nil)
    }

}
