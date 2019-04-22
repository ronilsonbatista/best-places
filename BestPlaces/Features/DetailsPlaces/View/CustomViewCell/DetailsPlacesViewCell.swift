//
//  DetailsPlacesViewCell.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailsPlacesViewCell: UITableViewCell {
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var vicinityLabel: UILabel!
    @IBOutlet weak var openingHoursLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(place: DetailsPlacesViewModel) {
        self.placeNameLabel.text = place.name
        self.vicinityLabel.text = place.formattedAddress
        
        if place.hasPhoto {
            if let imageURL = URL(string: place.photoURL) {
                self.placeImage!.af_setImage(withURL: imageURL)
            }
            return
        }
        
        self.placeImage.isHidden = true
    }
}
