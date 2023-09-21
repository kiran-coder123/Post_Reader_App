//
//  UserDetailsViewModel.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
class UserDetailsViewModel {
    
    var userDetails: UserDetailsModel!
    var users: [UserDetailsModel] = []
    
    func fetchUserDetails(user_Id: Int, completion: @escaping (UserDetailsModel?) -> Void) {
       // let urlString = "\(String(describing: URLConstant.userDetailsUrl))\(user_Id)"
       
       let urlString = "https://jsonplaceholder.typicode.com/users/\(user_Id)"
        
        guard let url = URL(string: urlString)  else {
                   completion(nil)
                   return
               }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
                   if let error = error {
                       print("Error fetching products: \(error)")
                       completion(nil)
                       return
                   }
                   
                   if let data = data {
                       let decoder = JSONDecoder()
                       do {
                           let users = try decoder.decode(UserDetailsModel.self, from: data)
                           completion(users)
                           
                       } catch {
                           print("Error decoding products: \(error)")
                           completion(nil)
                       }
                   }
               }.resume()
           }
    
}
