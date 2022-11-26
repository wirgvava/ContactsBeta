//
//  CallActionDelegate.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/17/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import Foundation

import UIKit

protocol CallActionDelegate: class {
    func callAction (phoneNumber: String)
    func addFavorite (name: String, surname: String, image: UIImage, phoneNumber: String)
}
