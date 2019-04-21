//
//  Environment.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 20/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

enum ServiceURL {
    
    case domain
    case places
    case detailsPlaces
    
    var value: String {
        switch self {
        case .domain: return "https://maps.googleapis.com/"
        case .places: return "maps/api/place/nearbysearch/json"
        case .detailsPlaces: return "maps/api/place/details/json"
        }
    }
}
