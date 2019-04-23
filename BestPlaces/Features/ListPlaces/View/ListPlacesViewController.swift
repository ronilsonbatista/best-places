//
//  ListPlacesViewController.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 22/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListPlacesViewController: UITableViewController {
    
    fileprivate var presenter: ListPlacesPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = ListPlacesPresenter(view: self)
        self.presenter.setupInitialization()
        
        self.tableView.backgroundColor = .colorBackground
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 165
        
        self.tableView.register(UINib(nibName: CardPlaceViewCell.identifier, bundle: nil), forCellReuseIdentifier: CardPlaceViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.presenter.getCurrentLocation()
    }
}

// MARK: - Table view data source

extension ListPlacesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.places?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardPlaceViewCell.identifier, for: indexPath) as! CardPlaceViewCell
        cell.selectionStyle = .none
        cell.setup(place: (self.presenter.places?.results[indexPath.row])!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextController = DetailsPlacesViewController()
        nextController.placeId = (self.presenter.places?.results[indexPath.row].placeID)!
        self.navigationController?.pushViewController(nextController, animated: true)
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: ListPlacesProtocol

extension ListPlacesViewController: ListPlacesProtocol {
    
    func startLoading() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.colorGreenyBlue)
        SVProgressHUD.setBackgroundColor(.colorBackground)
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
        self.navigationItem.setHidesBackButton(true, animated :true)
    }
}
