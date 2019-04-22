//
//  DetailsResult.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 22/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

struct DetailsResult: Codable {
    let adrAddress: String?
    let formattedAddress: String?
    let formattedPhoneNumber: String?
    let name: String
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let placeID: String
    let rating: Double?
    let reviews: [Review]?
    let url: String?
    let vicinity: String
    let website: String?
    
    enum CodingKeys: String, CodingKey {
        case adrAddress = "adr_address"
        case formattedAddress = "formatted_address"
        case formattedPhoneNumber = "formatted_phone_number"
        case name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case rating
        case reviews
        case url
        case vicinity
        case website
    }
}
