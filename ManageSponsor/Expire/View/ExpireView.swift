//
//  ExpireView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 20..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import UIKit

extension ExpireViewController {
    
    func defaultView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
}


extension ExpireViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExpireTableViewCell
        cell.nameLabel.text = "이지윤"
        cell.purposeLabel.text = " 학교 / 소프트웨어공학 / 발전기금 "
        cell.dateLabel.text = "2018-10-20"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
