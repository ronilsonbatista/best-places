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
    
    var placeId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = DetailsPlacesPresenter(view: self)
    }
}

// MARK: - Table view data source

extension DetailsPlacesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

// MARK: DetailsPlacesProtocol

extension DetailsPlacesViewController: DetailsPlacesProtocol {
    
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
