//
//  ReviewsViewModel.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 22/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation
import UIKit

final class ReviewsViewModel: NSObject {
    
    var authorName: String
    var profilePhotoURL: String
    var rating: Double
    var relativeTimeDescription: String
    var text: String
    
    init(authorName: String, rating: Double, profilePhotoURL: String, relativeTimeDescription: String, text: String) {
        
        self.authorName = authorName
        self.rating = rating
        self.profilePhotoURL = profilePhotoURL
        self.relativeTimeDescription = relativeTimeDescription
        self.text = text
    }
    
    var hasProfilePhoto: Bool {
        if self.profilePhotoURL.isEmpty {
            return false
        }
        return true
    }
    
    var hasRelativeTimeDescription: Bool {
        if self.relativeTimeDescription.isEmpty {
            return false
        }
        return true
    }
    
    var ratingColor: UIColor {
        if self.rating > 2.5 {
            return .green
        }
        return .red
    }
    
    var ratingText: Bool {
        if self.text.isEmpty {
            return false
        }
        return true
    }
}
