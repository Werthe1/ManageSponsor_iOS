//
//  LogView.swift
//  ManageSponsor
//
//  Created by hyerikim on 18/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit
import Firebase

extension LogViewController {
    
    func defaultView () {
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        db.collection("BankLog").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.logList.append(LogModel(name: document.data()["sposorName"] as! String, status: document.data()["state"] as! String, content: document.data()["donationPurpose"] as! String, date: document.data()["writeDate"] as! String, logNum: document.data()["agreementId"] as! String))
    
                    self.tableView.reloadData()
    
                }
            }
        }
    
    }
}

extension LogViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LogTableViewCell
        cell.dateLabel.text = logList[indexPath.row].date
        cell.logContentLabel.text = logList[indexPath.row].content
        cell.nameLabel.text = logList[indexPath.row].name
        cell.numberLabel.text = logList[indexPath.row].logNum
        cell.statusLabel.text = logList[indexPath.row].status
        
        cell.nameLabel.font = UIFont(name: "KoPubDotumBold", size: 15)
        cell.logContentLabel.font = UIFont(name: "KoPubDotumMedium", size: 14)
        cell.statusLabel.font = UIFont(name: "KoPubDotumBold", size: 15)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logList.count
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
        }
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
        
        UIView.animate(views: tableView.visibleCells, animations: animations, reversed: true,
                       initialAlpha: 1.0, finalAlpha: 0.0, completion: {
                        self.tableView.reloadData()
        })    }
    
}
