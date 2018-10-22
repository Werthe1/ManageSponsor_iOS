//
//  ExpireDetailViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 27..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class ExpireDetailViewController: UIViewController {
    
    @IBOutlet weak var extraView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var expireNumberLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var purposeLabel: UILabel!
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var accountInfoLabel: UILabel!
    @IBOutlet weak var etcLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultView()
    }

    @IBAction func callButtonPressed(_ sender: Any) {
        
        let number = "01051073914"
        if let phoneCallURL = URL(string: "tel://\(number)") {
            
            let application:UIApplication = UIApplication.shared
            
            if (application.canOpenURL(phoneCallURL)) {
                
                application.open(phoneCallURL, options: [:], completionHandler: nil)
                
            }
            
        }
        
    }
}
