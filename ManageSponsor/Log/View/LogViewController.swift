//
//  LogViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class LogViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var array1 = ["이지윤님의이지윤님의이지윤님의이지윤님의이지윤님의이지윤님의이지윤님의 개인정보가 변경되었습니다.","김혜리님의 개인정보가 변경되었습니다.","홍길동님의 개인정보가 변경되었습니다."]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LogTableViewCell
        cell.dateLabel.text = "2018.07.11"
        cell.logContentLabel.text = array1[indexPath.row]
        cell.nameLabel.text = "이지윤"
        cell.numberLabel.text = "0101010101"
        cell.statusLabel.text = "정상"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
