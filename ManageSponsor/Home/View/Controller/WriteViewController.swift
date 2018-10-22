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
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var monthCheck: UIImageView!
    @IBOutlet weak var yearCheck: UIImageView!
    @IBOutlet weak var defaultCheck: UIImageView!
    
    var placeholderLabel : UILabel!
    
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
        
        monthCheck.alpha = 1
        yearCheck.alpha = 0
        defaultCheck.alpha = 0

    }
    
    @IBAction func yearButtonPressed(_ sender: Any) {
        
        monthCheck.alpha = 0
        yearCheck.alpha = 1
        defaultCheck.alpha = 0
        
    }
    
    @IBAction func defaultButtonPressed(_ sender: Any) {
        
        monthCheck.alpha = 0
        yearCheck.alpha = 0
        defaultCheck.alpha = 1
        
    }
    
}
