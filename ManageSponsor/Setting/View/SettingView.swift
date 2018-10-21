//
//  SettingView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 27..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Toaster
import TKSwitcherCollection

//MARK: Manage tableview
extension SettingViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell\(indexPath.row)", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! ViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}

extension SettingViewController {
    
    func switchChanged(text : String) {
        Toast(text: "푸시 알림을 \(text)하셨습니다.").show()

    }
}
