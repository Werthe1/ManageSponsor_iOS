//
//  LogViewModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 22..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class LogViewModel {
    
    private var logModel : LogModel
    
    init(name: String, status: String, content: String, date: String, logNum: String) {
        self.logModel = LogModel(name: name, status: status, content: content, date: date, logNum: logNum)
    }
    
    var name: String {
        return logModel.name
    }
    
    var status : String {
        return logModel.status
    }
    
    var content : String {
        return logModel.content
    }
    
    var date : String {
        return logModel.date
    }
    
    var logNum : String {
        return logModel.logNum
    }
    
}
