//
//  HomeViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSoup
import ViewAnimator

class HomeViewController: UIViewController {

    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var array1 = ["2019-01-10", "후원자의 밤", "후원인 달력 발송","소식지 발송"]
    var array2 = ["김혜리 ", "2019-01-10", "2018-12-01", "2018-11-17"]
    var refresh : UIRefreshControl?
    
    let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
        defaultNavi()
        
    }

    @IBAction func writeButtonPressed(_ sender: Any) {

        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        write.modalPresentationStyle = .overCurrentContext
        self.present(write, animated: false, completion: nil)

    }
    
}
