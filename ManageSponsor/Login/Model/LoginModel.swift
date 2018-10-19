//
//  LoginModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 22..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

struct User {
    
    var id : String
    
    var password: String
    
    init(id: String, password: String) {
        self.id = id
        self.password = password
    }
}
