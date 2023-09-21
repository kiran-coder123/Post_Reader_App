//
//  URLConstant.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
struct URLConstant {
    static let baseUrl = URL(string: "https://jsonplaceholder.typicode.com/users/")
    static let postUrl =  URL(string: "https://jsonplaceholder.typicode.com/posts")
    static let userDetailsUrl =  URL(string: "\(String(describing: baseUrl))")
    static let userProfile = URL(string: "https://xsgames.co/randomusers/avatar.php?g=male")
}
