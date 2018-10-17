//
//  NavigationHelper.swift
//  ManageSponsor
//
//  Created by hyerikim on 13/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit


extension UIViewController {
    func initNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        
    }
    
}

class NavigationSetting: UINavigationController {
    func naviDefault() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        
    }
}
