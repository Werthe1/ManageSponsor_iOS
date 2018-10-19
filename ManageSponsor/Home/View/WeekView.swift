//
//  WeekView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 18..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import UIKit

class WeekView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        setupView()
    }
    
    func setupView(){
        
        addSubview(myStackView)
        myStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        myStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        myStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        myStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        var dayArr = ["월","화","수","목","금","토","일"]
        for i in 0..<7 {
            let label = UILabel()
            label.text = dayArr[i]
            label.textAlignment = .center
            label.font = UIFont(name: "KoPubDotumBold", size: 14)
            label.textColor = UIColor.black
            myStackView.addSubview(label)
        }
        
    }
    
    let myStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = UIColor.white
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
}
