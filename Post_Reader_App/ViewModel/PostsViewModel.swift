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
    private let postDataRepository: PostDataRepository = PostDataRepository()
    
    func fetchPosts(completion: @escaping ([PostModel]?) -> Void) {
        guard let url = URLConstant.postUrl else {
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
                    let post = try decoder.decode([PostModel].self, from: data)
                    self.posts = post
                    completion(post)
                } catch {
                    print("Error decoding products: \(error)")
                    completion(nil)
                }
                
            }
            
        }.resume()
    }
    func getPostsRecord(completionHander: @escaping(_ result: Array<PostModel>?) -> Void ){
        postDataRepository.getPostsRecords { response in
            if(response != nil && response?.count != 0) {
                // return response to the view controller
                completionHander(response)
            } else {
                // calll api
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //class PostsViewModel: NSObject {
    //    
    //  //  var posts: [PostModel] = []
    //    var apiHandler: APIHandler?
    //    var postUrl = URLConstant.postUrl
    //    
    //    func fetchPosts(completion: @escaping (PostModel) -> Void) {
    //        async {
    //            do {
    //                let response: PostModel = try await apiHandler!.fetch(from: (postUrl ?? URL(string: " "))!, responseType: [PostModel].self)
    //                completion(response)
    //            } catch {
    //                completion(APIResponse(data: nil, error: .requestFailed(error)))
    //            }
    //        }
    //    }
    //
    //    
    //   
    //        
    //        
    //       
    
    
    
    
    
    
    
    
    
    //        apiHandler.fetch(from: postUrl, responseType: [PostModel].self) { response in
    //            switch response {
    //            case .data(let posts):
    //                if let posts = posts {
    //                    self.posts = posts
    //                    for post in posts {
    //                        print(post.title)
    //                    }
    //                } else {
    //                    print("Error fetching posts")
    //                }
    //            case .error(let error):
    //                print("Error: \(error)")
    //            }
    //        }
    
    //        apiHandler.fetch(from: postUrl, responseType: [PostModel].self) { response in
    //            switch response {
    //            case .data(let posts):
    //                if let posts = posts {
    //                    self.posts = posts
    //                    for post in posts {
    //                        print(post.title)
    //                    }
    //                } else {
    //                    print("Error fetching posts")
    //                }
    //            case .error(let error):
    //                print("Error: \(error)")
    //            }
    //        }
    
    //}
    
    
    //     func getPostsRecord(completionHander: @escaping(_ result: Array<PostsModel>?) -> Void ){
    //        postDataRepository.getPostsRecords { response in
    //            if(response != nil && response?.count != 0) {
    //                // return response to the view controller
    //                completionHander(response)
    //            } else {
    //                // calll api
    //                self.fetchPosts { response in
    //                    if (response != nil && response?.count != 0) {
    //                        // insert record in core data
    //                       _ =  self.postDataRepository.insertPostsRecords(records: response ?? [])
    //                        completionHander(response)
    //                    }
    //                }
    //            }
    //        }
    //    }
    //}
}
