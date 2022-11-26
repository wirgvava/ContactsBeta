//
//  AddContactViewController.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/17/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    //MARK: IBOutlets -----------------------------------------------------------------------------
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var surnameLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var uploadProfileImage: UIButton!
    
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = 100
        imagePicker.delegate = self
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: IBActions -----------------------------------------------------------------------------
    @IBAction func uploadImage(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        uploadProfileImage.isHidden = true
    }
    
    
    @IBAction func saveContact(){
        saveContactAction()
    }
    
    // Function to saving contacts -----------------
    func saveContactAction (){
        guard self.nameLabel.text != nil else {return}
        guard self.surnameLabel.text != nil else {return}
        guard self.phoneNumberLabel.text != nil else {return}
        UsersDataManager.shared.addData(name: nameLabel.text!, surname: surnameLabel.text!, image: profileImage.image ?? #imageLiteral(resourceName: "avatar"), phoneNumber: phoneNumberLabel.text!)
    }
}


// TableView ---------------------------------------------------------------------------------------
extension AddContactViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}







