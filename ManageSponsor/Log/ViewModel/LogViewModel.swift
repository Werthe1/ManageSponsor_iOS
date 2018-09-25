//
//  LogViewModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 22..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class LoginViewModel {
    
    private var logModel : LogModel
    
    init(log: String, date: String) {
        self.logModel = LogModel(log: log, date: date)
    }
    
    var log: String {
        return logModel.log
    }
    
    var date: String {
        return logModel.date
    }
    
}
