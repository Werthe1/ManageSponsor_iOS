//
//  WriteView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 17..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import UIKit

enum MyTheme {
    case light
    case dark
}

extension WriteViewController {
    func defaultPage() {
        self.navigationItem.title = "글쓰기"
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
        print(notification)
    }
    
    @objc func pressedButton(){
        let uv = self.storyboard?.instantiateViewController(withIdentifier: "Calender") as! WriteCalenderViewController
        self.navigationController?.pushViewController(uv, animated: true)
    }
    
    @objc func doneButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
