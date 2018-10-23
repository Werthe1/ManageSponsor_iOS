//
//  HomeViewModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 10. 4..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class HomeViewModel {
    
    private var homeModel : HomeModel
    
    init(name: String, content: String, date: String , alert: Int) {
        homeModel = HomeModel(name: name, content: content, date: date, alert: alert)
    }
    
    var name : String {
        return homeModel.name
    }
    
    var content : String {
        return homeModel.content
    }
    
    var date: String {
        return homeModel.date
    }
    
    var alert: Int {
        return homeModel.alert
    }
}
