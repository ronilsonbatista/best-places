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
        let requestMethod = HTTPMethod(rawValue: method.rawValue)
        
        if !Connectivity.isConnectedToInternet() {
            failure(ServiceError(type: .noConnection))
            return
        }
        
        // Request
        AF.request(url, method: requestMethod, parameters: parameters, encoding: requestEncoding, headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                switch response.result {
                    
                case .success:
                    guard let responseData = response.data else {
                        failure(ServiceError(type: .badRequest))
                        return
                    }
                    
                    success(responseData)
                    
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        failure(ServiceError(type: .timeout))
                        return
                    }
                    
                    switch response.response?.statusCode {
                    case 403: failure(ServiceError(type: .forbidden))
                    case 401: failure(ServiceError(type: .unauthorized))
                    case 400: break;
                    default: failure(self.handleError(with: response))
                    }
                }
        }
    }
    
    private func handleError(with response: DataResponse<Any, AFError>) -> ServiceError {
        
        guard let statusCode = response.response?.statusCode else {
            return ServiceError(type: .badRequest)
        }
        
        switch statusCode {
        case ServiceError.ErrorType.badRequest.code:
            return ServiceError(type: .badRequest, object: response.data)
        default:
            let errorType = ServiceError.ErrorType(statusCode: statusCode)
            return ServiceError(type: errorType)
        }
    }
}
