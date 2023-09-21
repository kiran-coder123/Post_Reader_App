//
//  UserDetailsViewController.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    @IBOutlet weak var userDetailsTableview: UITableView!
    
    var userDetailViewModel: UserDetailsViewModel = UserDetailsViewModel()
    var user_Id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        DispatchQueue.main.async {
            self.fetchUserDetailsData()
        }

     }
    func fetchUserDetailsData(){
        userDetailViewModel.fetchUserDetails(user_Id: user_Id) { users in
            
            self.userDetailViewModel.userDetails = users
            
            DispatchQueue.main.async {
              //  print(users?.email ?? "no users")
                self.userDetailsTableview.reloadData()
            }
        }
    }
}
