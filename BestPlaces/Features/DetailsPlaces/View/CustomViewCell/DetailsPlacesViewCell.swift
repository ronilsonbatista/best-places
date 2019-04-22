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
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.placeImage.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(place: DetailsPlacesViewModel) {
        self.placeNameLabel.text = place.name
        self.vicinityLabel.text = place.formattedAddress
        
        if place.hasPhoto {
            self.placeImage.isHidden = false
            if let imageURL = URL(string: place.photoURL) {
                self.placeImage!.af_setImage(withURL: imageURL)
            }
        }
        
        self.ratingLabel.text =  String(format:"%.1f", place.rating)
        self.ratingLabel.textColor = place.ratingColor
        
        if place.reviews.count == 1 { self.reviewsLabel.text = "Avaliação:" }
        if place.reviews.count > 1 { self.reviewsLabel.text = "Avaliações:" }
        
        if place.reviews.count < 1 {
            self.reviewsLabel.isHidden = true
            self.ratingLabel.isHidden = true
        }
        
        if place.openNow { self.openingHoursLabel.text = "Aberto" }
        else { self.openingHoursLabel.text = "Fechado"}
    }
}
