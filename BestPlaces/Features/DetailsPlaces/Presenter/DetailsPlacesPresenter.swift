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
    fileprivate(set) var details: DetailsPlacesViewModel?
    
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
            
            self.handleData(detail: details.result)
            self.view.reloadView()
            self.view.stopLoading()
        }) {  error in
            if error.type == .noConnection {
                self.view.stopLoading()
                self.view.showAlertError(with: "Problema na conexão", message: "Encontramos problemas com a conexão. Tente ajustá-la para continuar navegando.", buttonTitle: "Tentar novamente", noConnection: true)
                return
            }
            
            self.handleError()
        }
    }
}

// MARK: - Private methods

extension DetailsPlacesPresenter {
    
    fileprivate func handleData(detail: DetailsResult) {
        
        var reviewsViewModel: [ReviewsViewModel] = []
        
        for reviews in detail.reviews ?? [] {
            reviewsViewModel.append(ReviewsViewModel(
                authorName: reviews.authorName, rating: reviews.rating ?? 0, profilePhotoURL: reviews.profilePhotoURL ?? "", relativeTimeDescription: reviews.relativeTimeDescription ?? "", text: reviews.text ?? "")
            )
        }
        self.fillDetailsPlacesViewModel(detail: detail, reviewsViewModel: reviewsViewModel)
    }
    
    fileprivate func fillDetailsPlacesViewModel(detail: DetailsResult, reviewsViewModel: [ReviewsViewModel]) {
        
        let details = DetailsPlacesViewModel(
            name: detail.name, rating: detail.rating ?? 0, formattedAddress: detail.formattedAddress ?? "", formattedPhoneNumber: detail.formattedPhoneNumber ?? "", maxwidth: detail.photos?.first?.width ?? 0, photoReference: detail.photos?.first?.photoReference ?? "", openNow: detail.openingHours?.openNow ?? false, reviews: reviewsViewModel
        )
        
        self.details = details
    }
    
    fileprivate func handleError() {
        self.view.stopLoading()
        self.view.showAlertError(with: "Erro encontrado", message: "Desculpe-nos pelo erro. Iremos contorná-lo o mais rápido possível.", buttonTitle: "OK", noConnection: false)
    }
}
