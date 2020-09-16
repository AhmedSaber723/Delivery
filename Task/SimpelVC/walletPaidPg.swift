//
//  walletPaidPg.swift
//  Task
//
//  Created by Saber on 3/21/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class walletPaidPg: UIViewController , UITableViewDataSource, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

      // Mark -> tableview
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "CellPage") as! CellPage
        tableView.rowHeight = 27
        return cell
    }

}
