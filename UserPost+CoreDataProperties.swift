//
//  UserPost+CoreDataProperties.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//
//

import Foundation
import CoreData
@objc(UserPost)
public class UserPost: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPost> {
        return NSFetchRequest<UserPost>(entityName: "UserPost")
    }

    @NSManaged public var userId: Int64
    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var body: String?
}

 
