//
//  ViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    @objc func loginButtonPressed() {
        if let st = self.storyboard?.instantiateViewController(withIdentifier: "NV") {
            present(st, animated: true, completion: nil)
        }
    }
    
    func setupViews() {
        
        let animation = LOTAnimationView.init(name: "cal")
        
        animation.frame = CGRect(x: (view.frame.midX - 150), y: 50, width: 300, height: 150)
        animation.contentMode = .scaleAspectFit
        animation.loopAnimation = true
        animation.animationProgress = 0.5
        self.view.addSubview(animation)
        animation.play()
        
//        self.view.addSubview(idTextField)
//        idTextField.topAnchor.constraint(equalTo: topAnchor).isActive=true
//        idTextField.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
//        idTextField.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
//        idTextField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    let idTextField: UITextField = {
        let id = UITextField()
        id.placeholder = "아이디를 입력하세요."
        id.textAlignment = .center
        id.font=UIFont.systemFont(ofSize: 16)
        id.translatesAutoresizingMaskIntoConstraints = false
        return id
    }()
    
    let passwordTextField: UITextField = {
        let pw = UITextField()
        pw.placeholder = "비밀번호를 입력하세요."
        pw.textAlignment = .center
        pw.font=UIFont.systemFont(ofSize: 16)
        pw.translatesAutoresizingMaskIntoConstraints = false
        return pw
    }()
    
}

