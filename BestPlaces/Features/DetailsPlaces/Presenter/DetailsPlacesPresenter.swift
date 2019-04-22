//
//  DetailsPlacesPresenter.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

final class DetailsPlacesPresenter {
    
    fileprivate unowned let view: DetailsPlacesProtocol
    fileprivate let service: PlacesService
    
    init(view: DetailsPlacesProtocol) {
        self.view = view
        self.service = PlacesService()
    }
}
