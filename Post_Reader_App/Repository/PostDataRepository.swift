//
//  PostDataRepository.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
import CoreData
struct PostDataRepository : PostCoreDataRepository {
   
    func insertPostsRecords(records: Array<PostModel>) -> Bool {
 

        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateManagedContext in
            //insert code
            records.forEach { postRecord in
                let cdPost = UserPost(context: privateManagedContext)
                cdPost.id = postRecord.id ?? 0
                cdPost.userId = postRecord.userId ?? 0
                cdPost.title = postRecord.title
                cdPost.body = postRecord.body
           }

            if(privateManagedContext.hasChanges){
                try? privateManagedContext.save()
            }
        }

        return true
    }

    
    
    func getPostsRecords(completionHandler: @escaping (Array<PostModel>?) -> Void) {

        PersistentStorage.shared.printDocumentDirectoryPath()

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: UserPost.self)
            let posts : Array<PostModel> = []
            result?.forEach({ (cdPosts) in
            //  posts.append(cdPosts.convertToPosts())
            })

            completionHandler(posts)

    }
}

