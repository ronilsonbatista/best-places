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
    fileprivate(set) var detailsPlaces: DetailsPlaces?
    
    init(view: DetailsPlacesProtocol) {
        self.view = view
        self.service = PlacesService()
    }
}

// MARK: - Public methods

extension DetailsPlacesPresenter {
    
    func setupInitialization(placeId: String) {
        self.view.navigationBarConfiguration()
        self.getDetailsPlaces(placeId: placeId)
    }
    
    func getDetailsPlaces(placeId: String) {
        
        self.view.startLoading()
        
        self.service.getDetailsPlaces(placeId: placeId, success: { detailsPlaces in
            guard let details = detailsPlaces else  {
                self.handleError()
                return
            }
            
            self.detailsPlaces = details
            self.view.reloadView()
            self.view.stopLoading()
        }) {  error in
            self.handleError()
        }
    }
    
    func handleError() {
        self.view.stopLoading()
        self.view.showAlertError(with: "Erro encontrado", message: "Desculpe-nos pelo erro. Iremos contorná-lo o mais rápido possível.", buttonTitle: "OK")
    }
}
