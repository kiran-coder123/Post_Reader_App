//
//  PostRepository.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
protocol PostBaseRepository {
    func getPostsRecords(completionHandler: @escaping (_ result: Array<PostModel>?)-> Void )
}
protocol PostCoreDataRepository : PostBaseRepository {
    func insertPostsRecords(records:Array<PostModel>) -> Bool
}

protocol PostApiResourceRepository : PostBaseRepository {
    
}
