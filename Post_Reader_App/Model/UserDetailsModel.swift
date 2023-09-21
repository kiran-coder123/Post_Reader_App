//
//  UserDetailsModel.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
// MARK: - User Detail
struct UserDetailsModel: Codable {
let id: Int?
let name, username, email: String?
let address: Address?
let phone, website: String?
let company: Company?
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}

