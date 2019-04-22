//
//  Photo.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 22/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let height: Int
    let htmlAttributions: [String]
    let photoReference: String
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        case height
        case htmlAttributions = "html_attributions"
        case photoReference = "photo_reference"
        case width
    }
}
