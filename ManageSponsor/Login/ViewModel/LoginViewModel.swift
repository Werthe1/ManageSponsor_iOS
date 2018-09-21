//
//  LoginViewModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 22..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class LoginViewModel {
    private var userInfo : User
    
    init(name: String, phoneNumber: String, email: String) {
        self.userInfo = User(name: name, phoneNumber: phoneNumber, email: email)
    }
    
    var userName: String {
        return userInfo.name
    }
    
    var userPhoneNumber: String {
        return userInfo.phoneNumber
    }
    
    var userEmail: String {
        return userInfo.email
    }
    
}
