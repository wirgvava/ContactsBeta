//
//  UsersDataManager.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/17/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import Foundation
import UIKit

class UsersDataManager {
    static let shared = UsersDataManager()
    
    // Main data of Contacts -----------------------------------------------------------------------------
    var data = [(name:"Koka", surname:"Tsirghvava", image: #imageLiteral(resourceName: "Koka Tsirgvava"), phoneNumber: "568 861 386"),
                (name:"Gio", surname:"Shamugia", image: #imageLiteral(resourceName: "Gio Shamugia"), phoneNumber: "568 123 312"),
                (name:"Alika", surname:"Salia", image: #imageLiteral(resourceName: "Alika Salia"), phoneNumber: "568 123 432"),
                (name:"Aza", surname:"Jiqia", image: #imageLiteral(resourceName: "Aza Jiqia"), phoneNumber: "568 543 753"),
                (name:"Fiodor", surname:"Dostojewski", image: #imageLiteral(resourceName: "Fiodor Dostojewski"), phoneNumber: "568 543 753"),
                (name:"Anna", surname:"Karenina", image: #imageLiteral(resourceName: "Anna Karenina"), phoneNumber: "568 543 753"),
                (name:"Lionel", surname:"Messi", image: #imageLiteral(resourceName: "Lionel Messi"), phoneNumber: "568 543 753"),
                (name:"John", surname:"Wick", image: #imageLiteral(resourceName: "John Wick"), phoneNumber: "568 543 753")
    ]
    
    // This is for add contacts to data ------------------------------------------------------------------
    func addData(name: String, surname: String, image: UIImage, phoneNumber: String) {
        data.append((name: name, surname: surname, image: image, phoneNumber: phoneNumber))
    }
    
    // This is for removing contacts from data -----------------------------------------------------------
    func removeData(index: Int) {
        data.remove(at: index)
    }
    
    
    // New array of tuples for searchbar -----------------------------------------------------------------
    var newData: [(name: String, surname: String, image: UIImage, phoneNumber: String)] = []
    
    // New array of tuples for Favorite contacts ---------------------------------------------------------
    var favoriteData: [(name: String, surname: String, image: UIImage, phoneNumber: String)] = []
    
}
