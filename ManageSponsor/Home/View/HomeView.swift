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
        
        db.collection("Schedule").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {

                    print(document.data())
                    
                    self.homelist.append(HomeModel(name: document.data()["writer"] as! String, content: document.data()["content"] as! String, date: document.data()["date"] as! String, alert: document.data()["alert"] as! Int))
                    
                    self.tableView.reloadData()
                    
                }
            }
        }
        
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
        
        cell.titleLabel.text = homelist[indexPath.row].date
        cell.dateLabel.text = homelist[indexPath.row].name
        cell.contentLabel.text = homelist[indexPath.row].content
        
        cell.titleLabel.font = UIFont(name: "KoPubDotumBold", size: 15)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homelist.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        write.modalPresentationStyle = .overCurrentContext
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
