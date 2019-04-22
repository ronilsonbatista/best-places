//
//  Review.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 22/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

struct Review: Codable {
    let authorName: String
    let authorURL: String
    let language: String?
    let profilePhotoURL: String?
    let rating: Double?
    let relativeTimeDescription: String?
    let text: String?
    let time: Int?
    
    enum CodingKeys: String, CodingKey {
        case authorName = "author_name"
        case authorURL = "author_url"
        case language
        case profilePhotoURL = "profile_photo_url"
        case rating
        case relativeTimeDescription = "relative_time_description"
        case text
        case time
    }
}
