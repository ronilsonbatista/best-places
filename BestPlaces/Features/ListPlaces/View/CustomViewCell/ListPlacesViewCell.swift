//
//  ListPlacesViewCell.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import UIKit

class ListPlacesViewCell: UICollectionViewCell {

    @IBOutlet weak var placesTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(places: Result) {
        self.placesTxt.text = places.name
    }
    
}
