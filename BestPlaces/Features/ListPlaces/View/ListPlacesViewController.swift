//
//  ListPlacesViewController.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "Cell"

class ListPlacesViewController: UICollectionViewController {
    
    fileprivate var presenter: ListPlacesPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = ListPlacesPresenter(view: self)
        self.presenter.setupInitialization()
        self.collectionView.backgroundColor = .colorBackground

        // Register cell classes
         self.collectionView!.register(UINib(nibName: ListPlacesViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ListPlacesViewCell.identifier)
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: self.collectionView.bounds.size.width, height: 132)
        }
    }
}

// MARK: UICollectionViewDataSource

extension ListPlacesViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.presenter.places?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListPlacesViewCell.identifier, for: indexPath) as! ListPlacesViewCell
        
        cell.setup(place: (self.presenter.places?.results[indexPath.row])!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: self.collectionView.bounds.size.width, height: 132)
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
        self.collectionView.reloadData()
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
