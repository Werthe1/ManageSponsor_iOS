//
//  MonthView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 17..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import UIKit

protocol monthViewDelegate: class {
    func didChnageMonthView(monthIndex: Int, year: Int)
}

class MonthView : UIView {
    var arrayMonth = ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
    var currentMonthIndex = 0
    var currentYear: Int = 0
    var delegate : monthViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        setupView()
        
        leftButton.isEnabled = false
    }
    
    @objc func leftButtonAction(sender: UIButton) {
        if sender == rightButton {
            currentMonthIndex += 1
            if currentMonthIndex > 11 {
                currentMonthIndex = 0
                currentYear += 1
            }
        } else {
            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                currentMonthIndex = 11
                currentYear -= 1
            }
            
        }
        labelName.text = "\(arrayMonth[currentMonthIndex]) \(currentYear)"
        delegate?.didChnageMonthView(monthIndex: currentMonthIndex, year: currentYear)
    }
    
    func setupView() {
        self.addSubview(labelName)
        labelName.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        labelName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        labelName.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        labelName.text = "\(arrayMonth[currentMonthIndex]) \(currentYear)"

        
        self.addSubview(rightButton)
        rightButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rightButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        rightButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        self.addSubview(leftButton)
        leftButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        leftButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        leftButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
    }
    
    let labelName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "KoPubDotumBold", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightButton: UIButton = {
       let button = UIButton()
        button.setTitle("앞", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(leftButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(leftButtonAction(sender:)), for: .touchUpInside)
        button.setTitleColor(UIColor.lightGray, for: .disabled)
        return button

    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not impledmented")
    }
}
