//
//  AboutTableViewCell.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/13/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets -----------------------------------------------------------------------------
    @IBOutlet weak var aboutLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
