//
//  HomeReturnPg.swift
//  Task
//
//  Created by Saber on 3/20/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit

class HomeReturnPg: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "HomeReturn") as! HomeReturnPG
        tableView.rowHeight = 290
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
