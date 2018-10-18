//
//  HomeViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSoup

class HomeViewController: UIViewController {

    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var array1 = ["2019-01-10", "후원자의 밤", "후원인 달력 발송","소식지 발송"]
    var array2 = ["김혜리 ", "2019-01-10", "2018-12-01", "2018-11-17"]
    var refresh : UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
        defaultNavi()
        
        let url = URL(string: "http://hyerios.tistory.com/")

        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error != nil {
                print(error)
            } else {
                let content = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                do {
                    try GetData(content)
                } catch {
                    
                }
            }
        }
        task.resume()
        
//        Alamofire.request(url){ response in
//            switch response.result {
//            case .success:
//                completion(json)
//                break
//            case .failure:
//                print("fail")
//                break
//            }
//        }
       
    }

    @IBAction func writeButtonPressed(_ sender: Any) {
        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        self.navigationController?.pushViewController(write, animated: false)
    }
    
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


struct GetData {
    
    init(_ innerHTML: Any) throws {
        let htmlString = innerHTML as? String
        
        let doc = try SwiftSoup.parse(htmlString!)
        let title = try doc.getElementsByClass("tit_post").array()
        let desc = try doc.getElementsByClass("txt_post").array()
        
//        for i in 0..<titles.count {
//            let title = try authors[i].text()
//            let desc = try titles[i].text()
//
//            print(author)
//            print(title)
//            let email = Email(author: author , title: title)
//            emails.append(email)
//        }
//        self.emails = emails
    }
}

struct GettingData {
    let title: String
    let desc: String
}
