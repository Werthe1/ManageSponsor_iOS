//
//  ExpireViewModel.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 26..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class ExprieViewModel {
    
    private var expireModel : ExprieModel
    
    init(name: String, date: String) {
        self.expireModel = ExprieModel(name: name, date: date)
    }
    
    var name: String {
        return expireModel.name
    }
    
    var date: String {
        return expireModel.date
    }
    
}


