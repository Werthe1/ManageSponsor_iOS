//
//  HomeView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 17..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Foundation
import Firebase

//MARK: Default view manage
extension HomeViewController {
    
    func defaultPage() {
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView.init(frame: .zero)
        
        floatingButton.clipsToBounds = true
        floatingButton.layer.cornerRadius = floatingButton.frame.width/2

        floatingButton.frame = CGRect(x: self.view.frame.width - 61, y: self.view.frame.height - (self.view.frame.height - self.tableView.frame.height), width: 45, height: 45)
        
        addRefresh()
        loadData()
        
    }
    
    func defaultNavi() {
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        initNavigation()
    }
    
    func updateYearMonthDay(day: String) -> String {
        
        let count = day.count
        var getDay = day

        switch count {
        case 10:
            
            getDay.insert("년", at: getDay.index(getDay.startIndex, offsetBy: 5))
            getDay.insert("월", at: getDay.index(getDay.startIndex, offsetBy: 9))
            getDay.insert("일", at: getDay.index(getDay.startIndex, offsetBy: 12))
            
        case 11:
            
            getDay.insert("년", at: getDay.index(getDay.startIndex, offsetBy: 5))
            getDay.insert("월", at: getDay.index(getDay.startIndex, offsetBy: 9))
            getDay.insert("일", at: getDay.index(getDay.startIndex, offsetBy: 13))
            
        default:
            
            getDay.insert("년", at: getDay.index(getDay.startIndex, offsetBy: 5))
            getDay.insert("월", at: getDay.index(getDay.startIndex, offsetBy: 8))
            getDay.insert("일", at: getDay.index(getDay.startIndex, offsetBy: 11))
            
        }
                
        return getDay
    }

}

//MARK: Manage tableview
extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        
        cell.outView.clipsToBounds = true
        cell.outView.layer.cornerRadius = 10
        
        let getDay = updateYearMonthDay(day: homelist[indexPath.row].date)

        cell.titleLabel.text = getDay

        cell.dateLabel.text = homelist[indexPath.row].name
        cell.contentLabel.text = homelist[indexPath.row].content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homelist.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        write.modalPresentationStyle = .overCurrentContext
        WriteViewController.myData = homelist[indexPath.row]
        self.present(write, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
        }
    }
}

extension HomeViewController : RefreshPro {
    
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
