//
//  Environment.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 20/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

enum ServiceURL {
    case places
    
    var value: String {
        switch self {
        case .places: return "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        }
    }
}
