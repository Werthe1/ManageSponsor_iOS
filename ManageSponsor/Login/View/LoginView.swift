//
//  LoginView.swift
//  ManageSponsor
//
//  Created by hyerikim on 19/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import Foundation
import Pastel

extension ViewController {
    
    func setupViews() {
        loginButton.layer.borderWidth = 0.5
        loginButton.layer.borderColor = UIColor.white.cgColor
        
        pastel()
    }
    
    func pastel() {
        
        let pastelView = PastelView(frame: view.bounds)
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 1.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        self.view.insertSubview(pastelView, at: 0)
        
    }
}
