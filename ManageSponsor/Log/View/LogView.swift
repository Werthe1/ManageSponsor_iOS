//
//  LogView.swift
//  ManageSponsor
//
//  Created by hyerikim on 18/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

extension LogViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LogTableViewCell
        cell.dateLabel.text = "2018.07.11"
        cell.logContentLabel.text = array1[indexPath.row]
        cell.nameLabel.text = "이지윤"
        cell.numberLabel.text = "0101010101"
        cell.statusLabel.text = "정상"
        
        cell.nameLabel.font = UIFont(name: "KoPubDotumBold", size: 15)
        cell.logContentLabel.font = UIFont(name: "KoPubDotumMedium", size: 14)
        cell.statusLabel.font = UIFont(name: "KoPubDotumBold", size: 15)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}


extension LogViewController : RefreshPro {
  
    func addRefresh() {
        refresh = UIRefreshControl()
        refresh?.tintColor = UIColor.black
        refresh?.addTarget(self, action: #selector(refreshAgain), for: .valueChanged)
        
        if let refresh = refresh {
            tableView.addSubview(refresh)
        }
    }
    
    @objc func refreshAgain() {
        refresh?.endRefreshing()
        tableView.reloadData()
    }
    
}
