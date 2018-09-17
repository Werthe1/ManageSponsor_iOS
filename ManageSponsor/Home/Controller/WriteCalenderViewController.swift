//
//  WriteCalenderViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 18..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class WriteCalenderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    let calenderView: CalenderView = {
        let view = CalenderView(theme: MyTheme.light)
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()

}
