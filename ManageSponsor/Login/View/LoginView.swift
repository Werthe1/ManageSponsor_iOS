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
        
        pwTextField.attributedPlaceholder = NSAttributedString(string: "아이디를 입력해주세요.",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        idTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        loginButton.layer.borderWidth = 0.5
        loginButton.layer.borderColor = UIColor.white.cgColor
        
        pastel()
    }
    
}
