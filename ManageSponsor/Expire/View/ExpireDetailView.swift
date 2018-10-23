//
//  ExpireDetailView.swift
//  ManageSponsor
//
//  Created by hyerikim on 19/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit
import Lottie

extension ExpireDetailViewController {

    func defaultView() {
        
        extraView.layer.cornerRadius = 5

        sponsorName.text = ExpireDetailViewController.detailList?.accountHolder
        birthdayLabel.text = ExpireDetailViewController.detailList?.sponsorBirth
        contactNumberLabel.text = ExpireDetailViewController.detailList?.sponsorContact
        sponsorNum.text = ExpireDetailViewController.detailList?.agreementId
       
        if let start = ExpireDetailViewController.detailList?.startDate , let end = ExpireDetailViewController.detailList?.endDate {
            
            durationDayLabel.text = "\(start) ~ \(end)"
        }

        purLabel.text = ExpireDetailViewController.detailList?.purpose
        
        if let amount = ExpireDetailViewController.detailList?.pay {
            payLabel.text = String(amount)
        }
        
        payMethod.text = ExpireDetailViewController.detailList?.payMethod
        
        if let amountDay = ExpireDetailViewController.detailList?.payDay {
            payDayLabel.text = String(amountDay)
        }
        
        if let holder = ExpireDetailViewController.detailList?.accountHolder , let no = ExpireDetailViewController.detailList?.accountNo, let info = ExpireDetailViewController.detailList?.bankName {
            
            payAccount.text = "\(holder) \(info) \(no)"
        }
    
        etcMentionLabel.text = ExpireDetailViewController.detailList?.etc
        
    }
    
}
