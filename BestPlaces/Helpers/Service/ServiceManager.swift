//
//  ServiceManager.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 19/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation
import Alamofire

final class ServiceManager: ServiceManagerProtocol {
    
    func request(method: ServiceHTTPMethod, url: String, parameters: [String : Any]?, encoding: ServiceEncoding, success: @escaping (Data) -> Void, failure: @escaping ((ServiceError) -> ())) {
        
        // Type used to define how a set of parameters are applied to request
        let requestEncoding: ParameterEncoding = {
            switch encoding {
            case .default: return URLEncoding.default
            case .json: return JSONEncoding.default
            }
        }()
        
        // HTTP method used
        let requestMethod = HTTPMethod(rawValue: method.rawValue)!
        
        if !Connectivity.isConnectedToInternet() {
            failure(ServiceError(type: .noConnection))
            return
        }
        
        // Request
        Alamofire.request(url, method: requestMethod, parameters: parameters, encoding: requestEncoding, headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                switch response.result {
                    
                case .success: success(response.data!)
                case .failure: failure(ServiceError(type: .badRequest))
                }
        }
    }
}
