//
//  WriteView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 17..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import UIKit

extension WriteViewController {
    
    func defaultPage() {
        
        totalView.clipsToBounds = true
        totalView.layer.cornerRadius = 10
        
        textView.delegate = self
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 12
        
        yearLabel.clipsToBounds = true
        yearLabel.layer.cornerRadius = 15
        yearLabel.layer.borderWidth = 1
        yearLabel.layer.borderColor = UIColor.darkGray.cgColor
        
        monthLabel.clipsToBounds = true
        monthLabel.layer.cornerRadius = 15
        monthLabel.layer.borderWidth = 1
        monthLabel.layer.borderColor = UIColor.darkGray.cgColor
        
        defaultLabel.clipsToBounds = true
        defaultLabel.layer.cornerRadius = 15
        defaultLabel.layer.borderWidth = 2
        defaultLabel.layer.borderColor = UIColor.darkGray.cgColor
        
        placeholderLabel = UILabel()
        placeholderLabel.text = "일정을 등록하세요."        
        placeholderLabel.font = UIFont(name: "KoPubDotumBold", size: 15)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !textView.text.isEmpty
        
        createObservers()
    }
    
    func defaultNavigation() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backbuttonicon")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backbuttonicon")
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.navigationBar.tintColor = UIColor.black
        let rightBarButtonItem = UIBarButtonItem.init(title: "확인", style: .done, target: self, action: #selector(doneButton))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(calenderSelect(notification:)), name: calender, object: nil)
    }
    
    @objc func calenderSelect(notification: NSNotification){
        if let date : String = notification.userInfo!["date"] as! String{
            self.dateLabel.text = date
        }

    }
   
    @objc func doneButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension WriteViewController : UITextViewDelegate {
 
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
