//
//  ProfilePage.swift
//  Task
//
//  Created by Saber on 8/3/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit
import MOLH
@available(iOS 13.0, *)
class ProfilePage: UIViewController {

    @IBOutlet weak var LaName: UILabel!
    @IBOutlet weak var ProImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BuDetails(_ sender: Any) {
        
        
    }
    
    @IBAction func BuChange(_ sender: Any) {
    }
    
    @IBAction func BuChangeLang(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Set language".localized , message: "Massage language".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cansel language".localized, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done language".localized, style: .default, handler: {(nil) in
            
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        if #available(iOS 13.0, *) {
            let delegate = UIApplication.shared.delegate as? AppDelegate
                delegate!.swichRoot()
        } else {
                               
                MOLH.reset()
        }
        }))
        
        present(alert,animated: true , completion: nil)
       
     
        
    }
    
    @IBAction func BuLogout(_ sender: Any) {
        
        let alert = UIAlertController(title: nil , message: "Massage language".localized, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Cansel language".localized, style: .cancel, handler: nil))
             alert.addAction(UIAlertAction(title: "Done language".localized, style: .default, handler: {(nil) in
                
                
                
                
                
        }))
        present(alert,animated: true , completion: nil)
        
    }
    
    
}
