//
//  ExpireDetailViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 27..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Firebase

class ExpireDetailViewController: UIViewController {
    
    @IBOutlet weak var etcMentionLabel: UILabel!
    @IBOutlet weak var purLabel: UILabel!
    @IBOutlet weak var durationDayLabel: UILabel!
    @IBOutlet weak var sponsorName: UILabel!
    @IBOutlet weak var payAccount: UILabel!
    @IBOutlet weak var payDayLabel: UILabel!
    @IBOutlet weak var payMethod: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var sponsorNum: UILabel!
    @IBOutlet weak var extraView: UIView!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var expireNumberLabel: UILabel!
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var accountInfoLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    
    static var detailList : ExprieDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultView()

    }

    @IBAction func callButtonPressed(_ sender: Any) {
        
        if let number = ExpireDetailViewController.detailList?.sponsorContact {
            
            var num = number
            
            num = number.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
            
            if let phoneCallURL = URL(string: "tel://\(num)") {
                
                let application:UIApplication = UIApplication.shared
                
                if (application.canOpenURL(phoneCallURL)) {
                    
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                    
                }
                
            }
            
        }
        
    }
}
