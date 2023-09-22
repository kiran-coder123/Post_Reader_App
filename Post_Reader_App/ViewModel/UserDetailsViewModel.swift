//
//  UserDetailsViewModel.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
class UserDetailsViewModel {
    private let apiHandler = APIHandler()
    var userDetails: UserDetailsModel!
    var users: [UserDetailsModel] = []
    
    func fetchUserDetails(user_Id: Int, completion: @escaping (UserDetailsModel?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users/\(user_Id)"
        
        guard let url = URL(string: urlString)  else {
            completion(nil)
            return
        }
        apiHandler.fetch(url: url, responseType: UserDetailsModel.self) { result in
            switch result {
            case .success(let user):
                completion(user)
            case .failure(let error):
                print("Error fetching posts: \(error)")
                completion(nil)
            }
        }
    }
    
}
