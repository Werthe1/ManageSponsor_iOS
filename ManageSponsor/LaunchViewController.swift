//
//  LaunchViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 12/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let animation = LOTAnimationView.init(name: "cal")
        
        animation.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        animation.contentMode = .scaleAspectFit
        animation.loopAnimation = true
        animation.animationProgress = 0.5
        self.view.addSubview(animation)
        animation.play()
        
    }

}
