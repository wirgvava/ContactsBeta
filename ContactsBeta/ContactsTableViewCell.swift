//
//  ContactsTableViewCell.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/13/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets -----------------------------------------------------------------------------
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!   //unselected
    @IBOutlet weak var favoriteButtonSellected: UIButton!   //selected
    
    
    
    var phoneNumber = ""
    weak var delegate: CallActionDelegate!
    
    func set(phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if favoriteButtonSellected.isHidden == false {                    // Favorite Button
            self.favoriteButtonSellected.isHidden = true                  // displays as
            self.favoriteButton.isHidden = false                          // unsellected
        } else {
            self.favoriteButtonSellected.isHidden = false
            self.favoriteButton.isHidden = true
        }
        
        photoImageView.layer.cornerRadius = 25                            // Makes image circle
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    //MARK: IBActions -----------------------------------------------------------------------------
    @IBAction func addFavorite(){
        self.favoriteButtonSellected.isHidden = false        //Favorite button is selected
        self.favoriteButton.isHidden = true
        delegate.addFavorite(name: nameLable.text!, surname: nameLable.text!, image: photoImageView.image!, phoneNumber: phoneNumber)
    }
    
    
    @IBAction func removeFavorite(){
        self.favoriteButtonSellected.isHidden = true        //Favorite button is Unselected
        self.favoriteButton.isHidden = false
    }
    
    
    @IBAction func ringAction(){
        delegate.callAction(phoneNumber: phoneNumber)
    }
}





