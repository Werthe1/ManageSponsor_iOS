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
    
    init(name: String, content: String, date: String) {
        homeModel = HomeModel(name: name, content: content, date: date)
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
}
