//
//  LoginModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 22..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

struct User {
    var name : String
    var phoneNumber : String
    var email : String
    
    init(name: String, phoneNumber: String, email: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
