//
//  WriteCalenderViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 18..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class WriteCalenderViewController: UIViewController {

    @IBOutlet weak var constraintX: NSLayoutConstraint!
    @IBOutlet weak var calView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraintX.constant = -500

        self.title = "My Calender"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        calView.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: calView.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: calView.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: calView.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
        constraintX.constant = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let calenderView: CalenderView = {
        let view = CalenderView(theme: MyTheme.light)
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()

}
