//
//  PersistenceStorage.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
import CoreData
final class PersistentStorage
{

    private init(){}
    static let shared = PersistentStorage()

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Post_Reader_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]?
    {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {return nil

            }

            return result

        } catch let error {
            debugPrint(error)
        }

        return nil
    }

    func printDocumentDirectoryPath() {
       debugPrint(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])
    }
    
    func fetchPosts() -> [UserPost]{
        var posts: [UserPost] = []
        
        do {
            posts = try  context.fetch(UserPost.fetchRequest())
        } catch  {
            print("fetched posts error")
        }
        return posts
    }
    
    
    
    
    
}
