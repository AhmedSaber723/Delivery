//
//  WalletWaitPaidPg.swift
//  Task
//
//  Created by Saber on 8/13/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class WalletWaitPaidPg: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func BuOpenWhats(_ sender: Any) {
        openWhatsapp(phoneNumber: "01023028488")
    }
    
    @IBAction func BuCallPhone(_ sender: Any) {
        callNumber(phoneNumber: "01204169590")
    }
    func openWhatsapp(phoneNumber : String){
         let urlWhats = "https://wa.me/+2\(phoneNumber)"
         if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
             if let whatsappURL = URL(string: urlString) {
                 if UIApplication.shared.canOpenURL(whatsappURL){
                   
                   
                        UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                         
                      
                        
                     }
                 }
                 else {
                     print("Install Whatsapp")
                
                     let download = "https://apps.apple.com/us/app/whatsapp-messenger/id310633997"
                     let url = URL(string: download)
                                            
                     let alert = UIAlertController(title: "Whatsapp not found", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
                    alert.addAction(UIAlertAction(title: "Download", style: .default, handler: {(nil) in
                                                
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                                                
                                            }))
                    present(alert, animated: true, completion: nil)
                
                 }
             }
         }
     

    
     func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }


}
