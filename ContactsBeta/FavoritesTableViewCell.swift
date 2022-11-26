//
//  FavoritesTableViewCell.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/21/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets -----------------------------------------------------------------------------
    @IBOutlet weak var favNameLable: UILabel!
    @IBOutlet weak var favPhotoImageView: UIImageView!
    
    
    var phoneNumber = ""
    weak var delegate: CallActionDelegate!
    
    func set(phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favPhotoImageView.layer.cornerRadius = 25                     // Makes image circle
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: IBActions -----------------------------------------------------------------------------
    @IBAction func favRingAction(){
        delegate.callAction(phoneNumber: phoneNumber)
    }
    
}
