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
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    
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
//        self.view.addSubview(animation)
        animation.play()
        
        
        loginView.clipsToBounds = true
        
        loginView.layer.cornerRadius = 20
        
        logoImage.clipsToBounds = true
        
        logoImage.layer.cornerRadius = 20
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

