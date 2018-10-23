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
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 5
        
        cancelButton.clipsToBounds = true
        cancelButton.layer.cornerRadius = 5
        
        yearLabel.clipsToBounds = true
        yearLabel.layer.cornerRadius = 10
        
        monthLabel.clipsToBounds = true
        monthLabel.layer.cornerRadius = 10

        defaultLabel.clipsToBounds = true
        defaultLabel.layer.cornerRadius = 10

        placeholderLabel = UILabel()

        if WriteViewController.myData != nil {
            dateLabel.text = WriteViewController.myData?.date
            textView.text = WriteViewController.myData?.content
            placeholderLabel.text = ""

        } else {
            placeholderLabel.text = " 일정을 등록하세요."
        }
        
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
