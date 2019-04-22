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
    fileprivate(set) var places: Places?
    
    init(view: ListPlacesProtocol) {
        self.view = view
        self.service = PlacesService()
    }
}

// MARK: - Public methods

extension ListPlacesPresenter {
    
    func setupInitialization() {
        self.view.navigationBarConfiguration()
        self.getPlaces()
    }
    
    func getPlaces() {
        
        self.view.startLoading()
        
        self.service.getPlaces(location: "-22.9035, -43.20963", success: { places in
            guard let places = places else {
                 self.handleError()
                return
            }
            
            self.places = places
            self.view.stopLoading()
            self.view.reloadView()
        }) {  error in
            self.handleError()
        }
    }
    
    func handleError() {
        self.view.stopLoading()
        self.view.showAlertError(with: "Erro encontrado", message: "Desculpe-nos pelo erro. Iremos contorná-lo o mais rápido possível.", buttonTitle: "OK")
    }
}
