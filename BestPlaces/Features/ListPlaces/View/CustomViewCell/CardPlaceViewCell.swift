//
//  CardPlaceViewCell.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 22/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import UIKit

class CardPlaceViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var vicinityLabel: UILabel!
    @IBOutlet weak var openingHoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.borderView.layer.cornerRadius = 10
        self.borderView.backgroundColor = UIColor.white
        self.borderView.clipsToBounds = true
    }
    
    func setup(place: Result) {
        self.placeNameLabel.text = place.name
        self.vicinityLabel.text = place.vicinity
        self.openingHoursLabel.text = "Aberto"
    }
}
