//
//  WriteViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {

    let calender = Notification.Name(rawValue: calenderClicked)
    
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var calButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var monthLabel: UIButton!
    @IBOutlet weak var yearLabel: UIButton!
    @IBOutlet weak var defaultLabel: UIButton!
    
    var placeholderLabel : UILabel!
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func calendarButtonPressed(_ sender: Any) {
        let popUp = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Calender") as! WriteCalenderViewController
        popUp.modalPresentationStyle = .overCurrentContext
        self.present(popUp, animated: false, completion: nil)
    }
    
    @IBAction func clearButtonpressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }

    @IBAction func monthButtonPressed(_ sender: Any) {
        
        yearLabel.layer.borderWidth = 1
        monthLabel.layer.borderWidth = 3
        defaultLabel.layer.borderWidth = 1

    }
    
    @IBAction func yearButtonPressed(_ sender: Any) {
        
        yearLabel.layer.borderWidth = 3
        monthLabel.layer.borderWidth = 1
        defaultLabel.layer.borderWidth = 1
        
    }
    
    @IBAction func defaultButtonPressed(_ sender: Any) {
        
        yearLabel.layer.borderWidth = 1
        monthLabel.layer.borderWidth = 1
        defaultLabel.layer.borderWidth = 3
        
    }
    
}
