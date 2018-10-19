//
//  LogModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 25..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class LogModel {
    
    var name : String
    var status : String
    var content : String
    var date : String
    var logNum : String
    
    init(name: String, status: String, content: String, date: String, logNum: String) {
        self.name = name
        self.status = status
        self.content = content
        self.date = date
        self.logNum = logNum
    }
    
}
