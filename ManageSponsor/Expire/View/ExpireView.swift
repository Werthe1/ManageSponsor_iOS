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
    
        loadData()
        
    }
    
}

//MARK: Manage tableview
extension ExpireViewController : UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExpireTableViewCell
        cell.nameLabel.text = exprieList[indexPath.row].sponsorName
        cell.purposeLabel.text = "\(dat) 일"
        cell.dateLabel.text = String(exprieList[indexPath.row].payDay)
        
        let now = Date()
        let end = exprieList[indexPath.row].endDate
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy'.'MM'.'dd"
        
        if let date = dateFormatter.date(from: end) {
            let day = getDay(start: now, end: date)
            cell.dueLabel.text = day

        }
        
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
//MARK: Between day - day
extension ExpireViewController {
    
    func getDay (start: Date, end: Date ) -> String {
        let calendar = NSCalendar.current
        
        let date1 = calendar.startOfDay(for: start)
        let date2 = calendar.startOfDay(for: end)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        if let bet = components.day {
            return "\(bet)일"
        }
        return "0 일"

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
