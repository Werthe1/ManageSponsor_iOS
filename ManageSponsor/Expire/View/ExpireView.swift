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
    }
    
}

//MARK: Manage tableview
extension ExpireViewController : UITableViewDataSource, UITableViewDelegate{
    
    enum Const {
        static let closeCellHeight: CGFloat = 170
        static let openCellHeight: CGFloat = 400
    }
    
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
