//
//  ExpireModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 26..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class ExprieModel {
    
    var name : String
    var date : String
    var payday : Int
    
    init(name: String, date: String, payday: Int) {
        self.name = name
        self.date = date
        self.payday = payday
    }
}
