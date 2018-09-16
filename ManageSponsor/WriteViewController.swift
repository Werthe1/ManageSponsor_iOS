//
//  WriteViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
    }

    func defaultPage() {
        self.navigationItem.title = "글쓰기"
        
        let titleText = UITextField()
        titleText.placeholder = "제목을 입력하세요"
        titleText.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(titleText)
    }
}
