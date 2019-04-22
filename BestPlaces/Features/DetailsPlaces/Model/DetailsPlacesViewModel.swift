//
//  DetailsPlacesViewModel.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation
import UIKit

final class DetailsPlacesViewModel: NSObject {
    
    var name: String
    var rating: Double
    var formattedAddress: String
    var formattedPhoneNumber: String
    var maxwidth: Int
    var photoReference: String
    var reviews: [ReviewsViewModel]

    init(name: String, rating: Double, formattedAddress: String, formattedPhoneNumber: String, maxwidth: Int, photoReference: String, reviews: [ReviewsViewModel]) {
        
        self.name = name
        self.rating = rating
        self.formattedAddress = formattedAddress
        self.formattedPhoneNumber = formattedPhoneNumber
        self.maxwidth = maxwidth
        self.photoReference = photoReference
        self.reviews = reviews
    }
    
    var ratingColor: UIColor {
        if self.rating > 2.5 {
            return .green
        }
        return .red
    }
    
    var hasPhoto: Bool {
        if self.photoReference.isEmpty {
            return false
        }
        return true
    }
    
    var photoURL: String {
        if self.hasPhoto {
            return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=\(self.maxwidth)&photoreference=\(self.photoReference)&key=AIzaSyCh4YlPwY-RWIJI0zAcUto-82Xfzfx-pqQ"
        }
        return ""
    }
}
