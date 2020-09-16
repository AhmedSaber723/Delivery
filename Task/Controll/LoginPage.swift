//
//  LoginPage.swift
//  Task
//
//  Created by Saber on 4/1/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit
import Alamofire

var  accesToken = ""

class LoginPage: UIViewController {
    
    @IBOutlet weak var TxUserName: UITextField!
    @IBOutlet weak var TxPassword: UITextField!
    
    typealias countriesCallBack = (_ countries:responses?, _ status: Bool, _ message:String) -> Void
    
    var callBack:countriesCallBack?
    
    var DATA : responses?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completionHandler { [weak self] (countries, status, message) in
                   if status {
                       guard let self = self else {return}
                       guard let _countries = countries else {return}
                       self.DATA = _countries
                      
                   }
               }
    
        
    }
    
    @IBAction func BuSignIn(_ sender: Any) {
      
     fetchMyVotes()
              
    }
    
    
    
    
    
    private func fetchMyVotes() {
      
    
        let username = TxUserName.text!
        let password = TxPassword.text!
        
 let urlString = "http://speeapi.promit2030.com/api/UserService/Login?DeviceType=123456&token&UserName=\(username)&Password=\(password)"
    
        AF.request(urlString,method: .post ).response { (responsData) in
            guard let data = responsData.data else {return}
            do {
                let apiclinic = try JSONDecoder().decode(responses.self, from: data)
                self.callBack?(apiclinic, true,"")
                accesToken = self.DATA?.Data?.access_token ?? ""
               
               self.performSegue(withIdentifier: "loginSegue", sender: self)
            }catch{
            self.callBack?(nil, false, error.localizedDescription)
            }
           
        }
     

    }
    func completionHandler(callBack: @escaping countriesCallBack) {
          self.callBack = callBack
      }


}

        
//        AF.request(urlstring,method: .post ).response { (responsData) in
//            guard let data = responsData.data else {return}
//            do {
//                let apiclinic = try JSONDecoder().decode(responses.self, from: data)
//                print(apiclinic)
//
//
//            }catch{
//                print(error.localizedDescription)
//            }
//
//        }
    
