//
//  HomeView.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 17..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Foundation

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
        
    }
    
    func defaultNavi() {
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        initNavigation()
    }

}

//MARK: Manage tableview
extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        cell.outView.clipsToBounds = true
        cell.outView.layer.cornerRadius = 10
        cell.titleLabel.text = array1[indexPath.row]
        cell.titleLabel.font = UIFont(name: "KoPubDotumBold", size: 15)

        cell.dateLabel.text = array2[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        write.modalPresentationStyle = .overCurrentContext
        self.present(write, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
