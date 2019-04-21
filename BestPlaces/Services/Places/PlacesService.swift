//
//  PlacesService.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 20/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

final class PlacesService {
    
    func getPlaces(location: String, success: @escaping (Places?) -> Void, fail: @escaping (_ error: ServiceError) -> Void) {
        
        let serviceUrl = ServiceURL.places.value
        
        let parameters = ["location": location,
                          "radius": 500,
                          "types": "parking",
                          "key": "AIzaSyCh4YlPwY-RWIJI0zAcUto-82Xfzfx-pqQ"] as [String: Any]
        
        ServiceRequest.shared.request(method: .get, url: serviceUrl, parameters: parameters, encoding: .default, success: { result in
            do {
                let places = try JSONDecoder().decode(Places.self, from: result)
                success(places)
            } catch {
                success(nil)
            }
        }, failure: { serviceError  in
            fail(serviceError)
        })
    }
    
    func getDetailsPlaces(placeid: String, success: @escaping (DetailsPlaces?) -> Void, fail: @escaping (_ error: ServiceError) -> Void) {
        
        let serviceUrl = ServiceURL.detailsPlaces.value
        
        let parameters = ["placeid": placeid,
                          "key": "AIzaSyCh4YlPwY-RWIJI0zAcUto-82Xfzfx-pqQ"] as [String: Any]
        
        ServiceRequest.shared.request(method: .get, url: serviceUrl, parameters: parameters, encoding: .default, success: { result in
            do {
                let detailsPlaces = try JSONDecoder().decode(DetailsPlaces.self, from: result)
                success(detailsPlaces)
            } catch {
                success(nil)
            }
        }, failure: { serviceError  in
            fail(serviceError)
        })
    }
    
    
}
