//
//  HomeDelivryPG.swift
//  Task
//
//  Created by Saber on 3/21/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
protocol SetAction {
      func openWhats(PhoneNumber:String)
      func callPhone(PhoneNumber:String)
      func deletRow()
      func OpenMap(Lat:String,Long:String)
  }
@available(iOS 13.0, *)
class HomeDelivryPG: UITableViewCell {
    
    @IBOutlet weak var LaPrice: UILabel!
    @IBOutlet weak var LaIdNumber: UILabel!
    @IBOutlet weak var LaName: UILabel!
    @IBOutlet weak var LaPhoneNumber: UILabel!
    @IBOutlet weak var LaLocation: UILabel!
    var delegete : SetAction?
    var index : IndexPath?
    var ClientsInform : Client!
    
    func SETClients(Client: Client) {
        ClientsInform = Client
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func BuOpenWhats(_ sender: Any) {
    
        delegete?.openWhats(PhoneNumber: "0" + "\(ClientsInform.client_phone!)")
    
    }
    
    @IBAction func BuCallPhone(_ sender: Any) {
        
        delegete?.callPhone(PhoneNumber: "0" + "\(ClientsInform.client_phone!)")
      
    }
    
    @IBAction func BuSeeLocation(_ sender: Any) {
        delegete?.OpenMap(Lat: "30.60711", Long: "32.277685")
    }
    
    @IBAction func BuRefuse(_ sender: Any) {
        
       // delegete?.deletRow()
       
    }
    @IBAction func BuDelivry(_ sender: Any) {
    }
    
}
