//
//  WriteViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Firebase

class WriteViewController: UIViewController {

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
    
    let calender = Notification.Name(rawValue: calenderClicked)
    let db = Firestore.firestore()
    var state = 0
    
    static var myData : HomeModel?
        
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
        WriteViewController.myData = nil
        self.dismiss(animated: false, completion: nil)
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        let ref: DocumentReference? = nil
        
        let docu : [String:Any] = ["content": textView.text,
                                   "date": dateLabel.text,
                                   "writer": "김혜리",
                                   "alert": state
        ]
        
        db.collection("Schedule").addDocument(data: docu) { (err) in
           
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                
                let reload = Notification.Name(rawValue: saveClicked)
                NotificationCenter.default.post(name: reload, object: nil)

                
                self.dismiss(animated: true, completion: nil)
            }
            
        }
        
    }
    
    @IBAction func monthButtonPressed(_ sender: Any) {
        
        state = 1
        updateCheck(state: state)

    }
    
    @IBAction func yearButtonPressed(_ sender: Any) {
        
        state = 2
        updateCheck(state: state)
        
    }
    
    @IBAction func defaultButtonPressed(_ sender: Any) {
        
        state = 0
        updateCheck(state: state)
        
    }
    
}
