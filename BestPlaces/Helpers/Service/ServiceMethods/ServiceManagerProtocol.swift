//
//  ServiceManagerProtocol.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 19/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

protocol ServiceManagerProtocol {
    
    // MARK: - Methods
    func request(method: ServiceHTTPMethod, url: String, parameters: [String: Any]?, encoding: ServiceEncoding, success: @escaping (Data) -> Void, failure: @escaping ((_ responseError: ServiceError)->()))
}
