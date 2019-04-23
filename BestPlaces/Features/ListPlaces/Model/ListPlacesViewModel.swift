//
//  ListPlacesViewModel.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation
import UIKit

final class ListPlacesViewModel: NSObject {
    
    var id: String
    var name: String
    var formattedAddress: String
    var openNow: Bool
    
    init(id: String, name: String, formattedAddress: String, openNow: Bool) {
        
        self.id = id
        self.name = name
        self.formattedAddress = formattedAddress
        self.openNow = openNow
    }
    
    var openNowColor: UIColor {
        if self.openNow {
            return .green
        }
        return .red
    }
    
    var openNowText: String {
        if self.openNow {
            return "Aberto"
        }
        return "Fechado"
    }
}
