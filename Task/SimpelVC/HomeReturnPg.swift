//
//  HomeReturnPg.swift
//  Task
//
//  Created by Saber on 3/21/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class HomeReturnPg: UIViewController ,UITableViewDataSource ,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeReturn") as! HomeReturnPG
        tableView.rowHeight = 290
        return cell
    }

    
}
