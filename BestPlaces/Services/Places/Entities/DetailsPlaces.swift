//
//  DetailsPlaces.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

struct DetailsPlaces: Codable {
    let result: DetailsResult
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case result, status
    }
}

struct DetailsResult: Codable {
    let addressComponents: [AddressComponent]
    let adrAddress, formattedAddress, formattedPhoneNumber: String
    let geometry: Geometry
    let icon: String
    let id, internationalPhoneNumber, name: String
    let openingHours: OpeningHours
    let photos: [Photo]
    let placeID: String
    let plusCode: PlusCode
    let rating: Double
    let reference: String
    let reviews: [Review]
    let scope: String
    let types: [String]
    let url: String
    let userRatingsTotal, utcOffset: Int
    let vicinity: String
    let website: String
    
    enum CodingKeys: String, CodingKey {
        case addressComponents = "address_components"
        case adrAddress = "adr_address"
        case formattedAddress = "formatted_address"
        case formattedPhoneNumber = "formatted_phone_number"
        case geometry, icon, id
        case internationalPhoneNumber = "international_phone_number"
        case name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case plusCode = "plus_code"
        case rating, reference, reviews, scope, types, url
        case userRatingsTotal = "user_ratings_total"
        case utcOffset = "utc_offset"
        case vicinity, website
    }
}

struct AddressComponent: Codable {
    let longName, shortName: String
    let types: [String]
    
    enum CodingKeys: String, CodingKey {
        case longName = "long_name"
        case shortName = "short_name"
        case types
    }
}


struct Period: Codable {
    let close, periodOpen: Close
    
    enum CodingKeys: String, CodingKey {
        case close
        case periodOpen = "open"
    }
}

struct Close: Codable {
    let day: Int
    let time: String
}

struct Review: Codable {
    let authorName: String
    let authorURL: String
    let language: String
    let profilePhotoURL: String
    let rating: Double
    let relativeTimeDescription, text: String
    let time: Int
    
    enum CodingKeys: String, CodingKey {
        case authorName = "author_name"
        case authorURL = "author_url"
        case language
        case profilePhotoURL = "profile_photo_url"
        case rating
        case relativeTimeDescription = "relative_time_description"
        case text, time
    }
}
