//
//  ViewController.swift
//  ContactsBeta
//
//  Created by Konstantine Tsirgvava on 11/13/22.
//  Copyright © 2022 Konstantine Tsirgvava. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets -----------------------------------------------------------------------------
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    let indexLetters: Array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    //    // Sorting Contacts by A-Z -------------------------------------------------------------------
    //    let orderedData = self.data.sorted {
    //        ($0.name, $0.surname) < ($1.name, $1.surname)
    //    }
    
    // Variables for Searchbar --------------------------------------------------------------------
    var data: [(name: String, surname: String, image: UIImage, phoneNumber: String)] = [(name: "", surname: "", image: UIImage(), phoneNumber: "")]
    
    
    // Variable and Function for SearchBar---------------------------------------------------------
    var searchText = ""{
        didSet{
            filterDataName()
        }
    }
    
    func filterDataName () {
        UsersDataManager.shared.newData = UsersDataManager.shared.data.filter({value in
            if value.name.lowercased().contains(searchText.lowercased()){
                return true
            } else if value.surname.lowercased().contains(searchText.lowercased()) {
                return true
            } else if value.phoneNumber.lowercased().contains(searchText.lowercased()){
                return true
            } else {
                return false
            }
            }
        )
        self.reloadData()
    }
    
    
    // ViewDidLoad & VieWillAppear -----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        self.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        self.reloadData()
    }
    
    
    //MARK: IBActions -----------------------------------------------------------------------------
    @IBAction func addContactAction(){
        openAddContactViewController()
    }
    
    
    // function for search --------------------------
    func reloadData(){
        if searchText != "" {
            self.data = UsersDataManager.shared.newData
        } else {
            self.data = UsersDataManager.shared.data
        }
        tableView.reloadData()
    }
}



// TableView --------------------------------------------------------------------------------------
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 26
    //    }
    //
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexLetters
    }
    //
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    //
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.indexLetters[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //       if indexPath.row > data.count - 1 {
        //            let aboutCell = tableView.dequeueReusableCell(withIdentifier: "AboutTableViewCell", for: indexPath) as! AboutTableViewCell
        //            aboutCell.aboutLable.text = "Your contancts count: \(data.count)"
        //            return aboutCell
        //        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        let dataForCell = self.data[indexPath.row]
        cell.nameLable.text = "\(dataForCell.name) \(dataForCell.surname)"
        cell.photoImageView.image = dataForCell.image
        cell.set(phoneNumber: (dataForCell.phoneNumber))
        cell.delegate = self
        return cell
        //        }
    }
    
    
    // Swipe to delete action ---------------------------------------------------------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            showDeleteAlert(index: indexPath)
        }
    }
    
    //Alert -----------------------------------------------------------------------------------
    func showDeleteAlert(index: IndexPath){
        let alert = UIAlertController(title: "Delete this number?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { handlerYes in
            let rowNumber : Int = index.row
            UsersDataManager.shared.removeData(index: rowNumber)
            self.data.remove(at: rowNumber)
            self.tableView.deleteRows(at: [index], with: .fade)
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
    
    
    // Navigation ---------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row <= self.data.count - 1{
            self.openProfileViewController(index: indexPath)
        }
    }
    
    
    func openProfileViewController (index: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "profileViewController") as! ProfileViewController
        let dataNew = self.data[index.row]
        vc.set(data: dataNew)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func openAddContactViewController (){
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "addContactViewController") as! AddContactViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



// CallAction --------------------------------------------------------------------------------
extension ViewController: CallActionDelegate {
    func callAction (phoneNumber: String){
        showAlert(phoneNumber: phoneNumber)
    }
    func addFavorite (name: String, surname: String, image: UIImage, phoneNumber: String){
        UsersDataManager.shared.favoriteData.append((name: name , surname: surname, image: image, phoneNumber: phoneNumber))
    }
    
    func showAlert(phoneNumber: String){
        let alert = UIAlertController(title: "Irekeba aq", message: phoneNumber, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}



//MARK: Searchbar ---------------------------------------------------------------------------
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
}
