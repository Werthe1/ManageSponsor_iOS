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
        
        floatingButton.clipsToBounds = true
        floatingButton.layer.cornerRadius = floatingButton.frame.width/2
    }

}

//MARK: Manage tableview
extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "스크롤링해서 제목 넣기"
        cell.detailTextLabel?.text = "날짜"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
