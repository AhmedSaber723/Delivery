//
//  CustomInterceptor.swift
//  Task
//
//  Created by Saber on 4/1/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import Foundation
import Alamofire

@available(iOS 13.0, *)
class CustomInterceptor:  RequestInterceptor {
    
    
   
    
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        
        
        
        var urlRequest = urlRequest
        if let urlString = urlRequest.url?.absoluteString,
            urlString.contains("/DR/AWBListOFD") {
            urlRequest.addValue(accesToken, forHTTPHeaderField: "Authorization")
            
        }
        completion(.success(urlRequest))
    }
    
}
