//
//  DetailsPlacesViewController.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailsPlacesViewController: UITableViewController {
    
    fileprivate var presenter: DetailsPlacesPresenter!
    
    var placeId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = DetailsPlacesPresenter(view: self)
        self.presenter.setupInitialization(placeId: self.placeId)
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 308
        
        self.tableView.register(UINib(nibName: DetailsPlacesViewCell.identifier, bundle: nil), forCellReuseIdentifier: DetailsPlacesViewCell.identifier)
        
        self.tableView.register(UINib(nibName: ReviewsViewCell.identifier, bundle: nil), forCellReuseIdentifier: ReviewsViewCell.identifier)
    }
}

// MARK: - Table view data source

extension DetailsPlacesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let details = self.presenter.details else { return 0 }
        
        if section == 0 { return 1 }
        
        return details.reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let details =  self.presenter.details else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailsPlacesViewCell.identifier, for: indexPath) as! DetailsPlacesViewCell
            cell.setup(place: details)
            return cell
            
        case 1:
            if details.reviews.count > 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: ReviewsViewCell.identifier, for: indexPath) as! ReviewsViewCell
                cell.setupReviews(reviews: details.reviews[indexPath.row])
                return cell
            }
            
             return UITableViewCell()
        default:  return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: DetailsPlacesProtocol

extension DetailsPlacesViewController: DetailsPlacesProtocol {
    
    func startLoading() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.colorGreenyBlue)
        SVProgressHUD.setBackgroundColor(.white)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
    
    func reloadView() {
        self.tableView.reloadData()
    }
    
    func showAlertError(with title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigationBarConfiguration() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.semibold)]
        self.navigationController?.navigationBar.barTintColor = .colorDarkishPink
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.tintColor = .white
    }
}
