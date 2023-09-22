//
//  PostsViewModel.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
import UIKit
class PostsViewModel: NSObject {
    
    var posts: [PostModel] = []
    private let apiHandler = APIHandler()  
    private let postDataRepository: PostDataRepository = PostDataRepository()
    func fetchPosts(completion: @escaping ([PostModel]?) -> Void) {
        guard let url = URLConstant.postUrl else {
            completion(nil)
            return
        }
        // Use APIHandler to fetch data
        apiHandler.fetch(url: url, responseType: [PostModel].self) { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                completion(posts)
            case .failure(let error):
                print("Error fetching posts: \(error)")
                completion(nil)
            }
        }
    }

    func getPostsRecord(completionHander: @escaping(_ result: Array<PostModel>?) -> Void ){
        postDataRepository.getPostsRecords { response in
            if(response != nil && response?.count != 0) {
                // return response to the view controller
                completionHander(response)
            } else {
                // call API
                self.fetchPosts { response in
                    if (response != nil && response?.count != 0) {
                        // insert record in core data
                       _ =  self.postDataRepository.insertPostsRecords(records: response ?? [])
                        completionHander(response)
                    }
                }
            }
        }
    }
}
