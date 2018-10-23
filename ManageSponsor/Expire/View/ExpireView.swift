//
//  ExpireView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 20..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import Foundation
import UIKit

//MARK: Setting default view
extension ExpireViewController {
    
    func defaultView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        addRefresh()
        
        db.collection("Agreement").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    print(document.data())
                    
                    self.dat = "\(document.data()["startDate"] as! String) ~ \(document.data()["endDate"] as! String)"
                    
                        self.exprieList.append(ExprieDetailModel(sponsorName: document.data()["sponsorName"] as! String, startDate: document.data()["startDate"] as! String, payDay: document.data()["payDay"] as! Int, sponsorBirth: document.data()["sponsorBirth"] as! String, endDate: document.data()["endDate"] as! String, accountHolder: document.data()["accountHolder"] as! String, bankName: document.data()["bankName"] as! String, purpose: document.data()["purpose"] as! String, sponsorNum: document.data()["sponsorNum"] as! String, accountNo: document.data()["accountNo"] as! String, payMethod: document.data()["payMethod"] as! String, agreementId: document.data()["agreementId"] as! String, etc: document.data()["etc"] as! String, sponsorContact: document.data()["sponsorContact"] as! String, pay: document.data()["pay"] as! Int))
             
                    self.tableView.reloadData()
                    
                }
            }
        }
        
    }
    
}

//MARK: Manage tableview
extension ExpireViewController : UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExpireTableViewCell
        cell.nameLabel.text = exprieList[indexPath.row].sponsorName
        cell.purposeLabel.text = "\(dat) 일"
        cell.dateLabel.text = String(exprieList[indexPath.row].payDay)
        cell.dueLabel.text = "만료 52일 전"
        
        
        cell.nameLabel.font = UIFont(name: "KoPubDotumBold", size: 16)
        cell.dueLabel.font = UIFont(name: "KoPubDotumBold", size: 14)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exprieList.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nv = self.storyboard?.instantiateViewController(withIdentifier: "ExpireDetail") as! ExpireDetailViewController
        ExpireDetailViewController.detailList = exprieList[indexPath.row]
        self.navigationController?.pushViewController(nv, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
        }
    }
    
}

//MARK: Refresh protocol
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
        
        UIView.animate(views: tableView.visibleCells, animations: animations, reversed: true,
                       initialAlpha: 1.0, finalAlpha: 0.0, completion: {
                        self.tableView.reloadData()
        })
        
    }
    
}

