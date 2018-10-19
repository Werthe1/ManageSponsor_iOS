//
//  ViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import TransitionButton
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: TransitionButton!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    
    private var loginViewModel : LoginViewModel? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        loginButton.startAnimation()
        if let st = self.storyboard?.instantiateViewController(withIdentifier: "NV") {
            present(st, animated: true, completion: nil)
        }
    }
    
}

