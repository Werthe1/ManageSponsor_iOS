//
//  ExpireDetailModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 24/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class ExprieDetailModel {
    
    var sponsorName : String
    var startDate : String
    var payDay : Int
    var sponsorBirth : String
    var endDate : String
    var accountHolder :  String
    var bankName : String
    var purpose : String
    var sponsorNum : String
    var accountNo : String
    var payMethod :String
    var agreementId : String
    var etc : String
    var sponsorContact : String
    var pay : Int
    
    init(sponsorName : String, startDate : String, payDay : Int, sponsorBirth : String, endDate : String, accountHolder : String, bankName : String, purpose : String, sponsorNum : String, accountNo : String, payMethod :String, agreementId : String, etc : String, sponsorContact : String, pay : Int) {
        self.sponsorName = sponsorName
        self.startDate = startDate
        self.payDay = payDay
        self.sponsorBirth = sponsorBirth
        self.endDate = endDate
        self.accountHolder = accountHolder
        self.bankName = bankName
        self.purpose = purpose
        self.sponsorNum = sponsorNum
        self.accountNo = accountNo
        self.payMethod = payMethod
        self.agreementId = agreementId
        self.etc = etc
        self.sponsorContact = sponsorContact
        self.pay = pay
    }
}
