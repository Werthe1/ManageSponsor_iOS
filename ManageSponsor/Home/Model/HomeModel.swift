//
//  HomeModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 17..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeModel {
    
    var name : String
    var content : String
    var date : String
    var alert : Int
    
    init(name: String, content: String ,date: String, alert: Int) {
        self.name = name
        self.content = content
        self.date = date
        self.alert = alert
    }
    
}
