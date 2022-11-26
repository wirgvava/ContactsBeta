//
//  FavouritesViewController.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/20/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    //MARK: IBOutlets -----------------------------------------------------------------------------
    @IBOutlet weak var tableView: UITableView!


    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



// TableView --------------------------------------------------------------------------------------
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UsersDataManager.shared.favoriteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell
        let dataForCell = UsersDataManager.shared.favoriteData[indexPath.row]
        cell?.favNameLable.text = "\(dataForCell.name) \(dataForCell.surname)"
        cell?.favPhotoImageView.image = dataForCell.image
        cell?.set(phoneNumber: (dataForCell.phoneNumber))
//        cell?.delegate = self as! CallActionDelegate
        return cell!
    }
}

