//
//  ExpireViewController.swift
//  ManageSponsor
//
//  Created by hyerikim on 2018. 9. 13..
//  Copyright © 2018년 hyerikim. All rights reserved.
//

import UIKit

class ExpireViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var array1 = ["이지윤","김혜리","홍길동","임꺽정","김나나","김수로","박정준","이서희","옥고인" ]
    var array2 = ["납입기간 : 2018.10.18 ~ 2018.10.18","납입기간 : 2018.10.18 ~ 2018.10.18","성공회대 장학금","학교 / 디지털컨텐츠 / 발전기금","학교 / 신문방송학과 / 발전기금","미가엘성당 건축 기부금", "해외인턴쉽 지원금", "중앙도서관","100주년 기부금"]
    var array3 = ["납입일 : 20", "2018-11-18","2019-01-04","2019-01-27","2018-11-12","2018-12-18","2019-03-24","2018-11-08","2019-11-04"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultView()
    }


}
