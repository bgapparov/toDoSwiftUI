//
//  ToDoItem.swift
//  ToDo
//
//  Created by Baiaman Gapparov on 7/26/20.
//  Copyright © 2020 Baiaman Gapparov. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem>{
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as!
        NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
