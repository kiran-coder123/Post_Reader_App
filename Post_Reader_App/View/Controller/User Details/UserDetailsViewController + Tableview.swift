//
//  UserDetailsViewController + Tableview.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

 
import UIKit
extension UserDetailsViewController: UITableViewDelegate {
    
}
extension UserDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userDetailsTableview.dequeReusableCell(UserDetailsTableViewCell.self) else {return UITableViewCell()}
        
        guard let _ = userDetailViewModel.userDetails else {
            return cell
        }
        
        cell.nameLabel.text = (userDetailViewModel.userDetails.name ?? " ")
        cell.emailLabel.text = (userDetailViewModel.userDetails.email ?? " ")
        cell.companyLabel.text =  (userDetailViewModel.userDetails.company?.name ?? " ")
        cell.websitesLabel.text = (userDetailViewModel.userDetails.website ?? " ")
        cell.addressLabel.text =  (userDetailViewModel.userDetails.address?.city)! + " ," + (userDetailViewModel.userDetails.address?.street)!
         cell.phoneLabel.text = userDetailViewModel.userDetails.phone
        cell.locationLabel.text = "📍"
        cell.userDetailViewModel = userDetailViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
