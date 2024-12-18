//
//  UserTask+CoreDataProperties.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 15.11.24.
//

import Foundation
import CoreData


extension UserTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserTask> {
        return NSFetchRequest<UserTask>(entityName: "UserTask")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?
    @NSManaged public var userId: String?

}

extension UserTask : Identifiable {

}
