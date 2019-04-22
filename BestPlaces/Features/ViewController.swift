//
//  ViewController.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 19/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var placesService = PlacesService()
    var places: Places?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placesService.getPlaces(location: "-22.9035, -43.20963", success: { places in
            guard let places = places else {
                return
            }
            
            self.places = places
        }) {  error in
            print("Error: \(error)")
        }
    }
}
