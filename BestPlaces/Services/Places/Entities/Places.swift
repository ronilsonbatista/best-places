//
//  Places.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

struct Places: Codable {
    
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
         case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.results = try values.decode([Result].self, forKey: .results)
    }
}
