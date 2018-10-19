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
    
    init(id: String, password: String) {
        self.userInfo = User(id: id, password: password)
    }
    
    var id : String {
        return userInfo.id
    }
    
    var password : String {
        return userInfo.password
    }
    
}

extension LoginViewModel {
    
}
