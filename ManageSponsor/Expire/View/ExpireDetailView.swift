//
//  ExpireDetailView.swift
//  ManageSponsor
//
//  Created by hyerikim on 19/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit
import Lottie

extension ExpireDetailViewController {

    func defaultView() {
        
        nameLabel.font = UIFont(name: "KoPubDotumBold", size: 17)
        expireNumberLabel.font = UIFont(name: "KoPubDotumBold", size: 17)
        accountInfoLabel.font = UIFont(name: "KoPubDotumBold", size: 17)
        durationLabel.font = UIFont(name: "KoPubDotumBold", size: 17)
        purposeLabel.font = UIFont(name: "KoPubDotumBold", size: 17)
        etcLabel.font = UIFont(name: "KoPubDotumBold", size: 17)
        moneyLabel.font = UIFont(name: "KoPubDotumBold", size: 17)
        methodLabel.font = UIFont(name: "KoPubDotumBold", size: 17)
        titleLabel.font = UIFont(name: "KoPubDotumBold", size: 20)
        
        nameLabel.layer.cornerRadius = 5
        expireNumberLabel.layer.cornerRadius = 5
        accountInfoLabel.layer.cornerRadius = 5
        durationLabel.layer.cornerRadius = 5
        purposeLabel.layer.cornerRadius = 5
        etcLabel.layer.cornerRadius = 5
        moneyLabel.layer.cornerRadius = 5
        methodLabel.layer.cornerRadius = 5
        
        let animation = LOTAnimationView.init(name: "cal")
        animation.frame = CGRect(x: (view.frame.minX + 32), y: titleLabel.frame.minY + 25, width: 50, height: 50)
        animation.contentMode = .scaleAspectFit
        animation.loopAnimation = true
        animation.animationProgress = 0.5
        self.view.addSubview(animation)
        animation.play()

    }
    
}
