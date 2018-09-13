//
//  HomeViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPage()
    }

    func defaultPage() {
        tableView.delegate = self
        tableView.dataSource = self
        
        floatingButton.clipsToBounds = true
        floatingButton.layer.cornerRadius = floatingButton.frame.width/2
    }

    @IBAction func writeButtonPressed(_ sender: Any) {
        let write = self.storyboard?.instantiateViewController(withIdentifier: "WriteView") as! WriteViewController
        self.navigationController?.pushViewController(write, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}


