//
//  Result.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 22/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

struct Result: Codable {
    let name: String
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let placeID: String
    let rating: Double?
    let vicinity: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case rating
        case vicinity
    }
}
