//
//  DatabaseController.swift
//  
//
//  Created by Mateus Sousa on 05/04/21.
//

import Foundation
import CoreData

public class DatabaseController {
    
    private static var model: NSManagedObjectModel!
    private static let entitiesClass: [EntityProtocol] = {[
        User()
    ]}()
    
    private init() { }
    
    static public func initialize() {
        model = NSManagedObjectModel()
        model.entities = entitiesClass.map { $0.createEntity() }
    }
    
    static public var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Database", managedObjectModel: DatabaseController.model)
        container.loadPersistentStores { (storeDescription, error) in
            guard let error = error as NSError? else {
                return
            }
            fatalError("unresolved error \(error), \(error.userInfo)")
        }
        return container
    }()
    
    static public func saveContext() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        }catch let error as NSError {
            fatalError("unresolved error \(error), \(error.userInfo)")
        }
    }
    
    static public func fetch<T: EntityProtocol>(type: T.Type, request: NSFetchRequest<NSManagedObject>? = nil) throws -> [T]? {
        return try DatabaseController.persistentContainer.viewContext.fetch(request ?? T.request()) as? [T]
    }
}
