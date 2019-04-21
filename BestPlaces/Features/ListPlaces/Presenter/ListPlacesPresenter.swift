//
//  ListPlacesPresenter.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

final class ListPlacesPresenter {
    
    fileprivate unowned let view: ListPlacesProtocol
    fileprivate let service: PlacesService
    
    init(view: ListPlacesProtocol) {
        self.view = view
        self.service = PlacesService()
    }
}

// MARK: - Public methods

extension ListPlacesPresenter {
    
    func setupInitialization() {
        self.view.navigationBarConfiguration()
    }
    
}
