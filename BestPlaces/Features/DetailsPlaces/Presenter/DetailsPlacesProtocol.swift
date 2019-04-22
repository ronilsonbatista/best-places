//
//  DetailsPlacesProtocol.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

protocol DetailsPlacesProtocol: class {
    
    func startLoading()
    func stopLoading()
    func reloadView()
    func showAlertError(with title: String, message: String, buttonTitle: String)
    func navigationBarConfiguration()
}
