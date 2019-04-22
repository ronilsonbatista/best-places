//
//  ReviewsViewCell.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 22/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import UIKit

class ReviewsViewCell: UITableViewCell {
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var profilePhotoImage: UIImageView!
    @IBOutlet weak var relativeTimeDescriptionLabel: UILabel!
    @IBOutlet weak var textReviewsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.borderView.layer.cornerRadius = 10
        self.borderView.backgroundColor = UIColor.white
        self.borderView.clipsToBounds = true
        self.borderView.layer.borderWidth = 0.5
        self.borderView.layer.borderColor = UIColor.colorCharcoalGrey.cgColor
        
        self.profilePhotoImage.isHidden = true
        self.relativeTimeDescriptionLabel.isHidden = true
        self.textReviewsLabel.isHidden = true
    }
    
    func setupReviews(reviews: ReviewsViewModel) {
        self.authorNameLabel.text = reviews.authorName
        
        if reviews.hasProfilePhoto {
            self.profilePhotoImage.isHidden = false
            if let imageURL = URL(string: reviews.profilePhotoURL) {
                self.profilePhotoImage!.af_setImage(withURL: imageURL)
            }
        }
        
        if reviews.ratingText {
            self.textReviewsLabel.isHidden = false
            self.textReviewsLabel.text = reviews.text
        }
        
        if reviews.hasRelativeTimeDescription {
            self.relativeTimeDescriptionLabel.isHidden = false
            self.relativeTimeDescriptionLabel.text = reviews.relativeTimeDescription
        }
        
        self.ratingLabel.text =  String(format:"%.1f", reviews.rating)
        self.ratingLabel.textColor = reviews.ratingColor
    }
}

