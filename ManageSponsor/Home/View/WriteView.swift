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
        
        let titleText = UITextField()
        titleText.placeholder = "제목을 입력하세요"
        titleText.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(titleText)
        createObservers()
    }
    
    func defaultNavigation() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backbuttonicon")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backbuttonicon")
        self.navigationController?.navigationBar.topItem?.title = " "

        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "scheduleiconicon"), style: .done, target: self, action: #selector(pressedButton))
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
    
}
