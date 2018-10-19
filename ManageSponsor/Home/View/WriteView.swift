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
        
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.cornerRadius = 5
        calButton.layer.cornerRadius = calButton.frame.width/2
        createObservers()
    }
    
    func defaultNavigation() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backbuttonicon")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backbuttonicon")
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.navigationBar.tintColor = UIColor.black
        let rightBarButtonItem = UIBarButtonItem.init(title: "확인", style: .done, target: self, action: #selector(doneButton))
        calButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
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
    
    @objc func pressedButton(){
        
        let popUp = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Calender") as! WriteCalenderViewController
        popUp.modalPresentationStyle = .overCurrentContext
        self.present(popUp, animated: false, completion: nil)
    
    }
    
    @objc func doneButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
