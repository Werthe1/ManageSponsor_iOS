//
//  ViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
    }
    
    func defaultPage(){
        let loginButton = UIButton()
        loginButton.titleLabel?.text = "로그인"
        loginButton.tintColor = UIColor.black
        loginButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        loginButton.addTarget(self, action: #selector(self.loginButtonPressed), for: .touchUpInside)
        self.view.addSubview(loginButton)
    }
    
    @objc func loginButtonPressed() {
        
        if let st = self.storyboard?.instantiateViewController(withIdentifier: "NV") {
            present(st, animated: true, completion: nil)
        }
    }
}

