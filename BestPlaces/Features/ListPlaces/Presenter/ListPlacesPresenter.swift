//
//  ListPlacesPresenter.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation
import MapKit

final class ListPlacesPresenter {
    
    fileprivate unowned let view: ListPlacesProtocol
    fileprivate let service: PlacesService
    fileprivate(set) var places: Places?
    fileprivate let locManager = CLLocationManager()
    
    init(view: ListPlacesProtocol) {
        self.view = view
        self.service = PlacesService()
    }
}

// MARK: - Public methods

extension ListPlacesPresenter {
    
    func setupInitialization() {
        self.view.navigationBarConfiguration()
        self.locManager.requestWhenInUseAuthorization()
    }
}

// MARK: - Private methods

extension ListPlacesPresenter {
    
    func getCurrentLocation() {
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        switch authorizationStatus {
        case .authorizedWhenInUse:
            self.locManager.startUpdatingLocation()
            self.getCoordinate()
        case .denied:
            self.view.showAlertError(with: "Permissão negada", message: "Vá em configuracões e aceite a permissão para localização.", buttonTitle: "OK")
        default:
            locManager.requestWhenInUseAuthorization()
            self.getCurrentLocation()
        }
    }
    
    fileprivate func getCoordinate() {
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            
            guard let currentLocation = locManager.location else {
                self.handleError()
                return
            }
            
            self.getPlaces(location: "\(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)")
        }
    }
    
    fileprivate func getPlaces(location: String) {
        
        self.view.startLoading()
        
        self.service.getPlaces(location: location, success: { places in
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
    
    fileprivate func handleError() {
        self.view.stopLoading()
        self.view.showAlertError(with: "Erro encontrado", message: "Desculpe-nos pelo erro. Iremos contorná-lo o mais rápido possível.", buttonTitle: "OK")
    }
}
