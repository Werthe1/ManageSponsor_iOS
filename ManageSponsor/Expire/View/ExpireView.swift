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
        addRefresh()
    }
    
}


extension ExpireViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExpireTableViewCell
        cell.nameLabel.text = array1[indexPath.row]
        cell.purposeLabel.text = array2[indexPath.row]
        cell.dateLabel.text = array3[indexPath.row]
        
        cell.nameLabel.font = UIFont(name: "KoPubDotumBold", size: 16)
        cell.dueLabel.font = UIFont(name: "KoPubDotumBold", size: 14)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nv = self.storyboard?.instantiateViewController(withIdentifier: "ExpireDetail") as! ExpireDetailViewController
        self.navigationController?.pushViewController(nv, animated: true)
    }

}

extension ExpireViewController : RefreshPro {
    
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
