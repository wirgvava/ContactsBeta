//
//  ProfileViewController.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/17/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: IBOutlets -----------------------------------------------------------------------------
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    
    var data:(name : String, surname: String , image: UIImage, phoneNumber: String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        profileImage.image = data?.image
        nameLabel.text = data?.name
        surnameLabel.text = data?.surname
        phoneNumber.text = data?.phoneNumber
        profileImage.layer.cornerRadius = 100
    }
    
    
    func set(data: (name : String, surname: String , image: UIImage, phoneNumber: String)) {
        self.data = data
    }
}
