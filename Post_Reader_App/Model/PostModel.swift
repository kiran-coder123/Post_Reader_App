//
//  PostModel.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
struct PostModel: Codable {
    let userId: Int64?
    let id: Int64?
    let title: String?
    let body: String?
}
