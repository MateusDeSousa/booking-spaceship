//
//  User.swift
//  
//
//  Created by Mateus Sousa on 05/04/21.
//

import Foundation
import CoreData

final public class User: NSManagedObject, EntityProtocol {
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    
    static public func createEntity() -> NSEntityDescription {
        //Entity
        let userEntity = NSEntityDescription()
        userEntity.name = "User"
        userEntity.managedObjectClassName = NSStringFromClass(Self.self)
        
        //Attributes
        let name = NSAttributeDescription()
        name.name = "name"
        name.attributeType = .stringAttributeType
        
        let id = NSAttributeDescription()
        id.name = "id"
        id.attributeType = .UUIDAttributeType
        
        let email = NSAttributeDescription()
        email.name = "email"
        email.attributeType = .stringAttributeType
        
        userEntity.properties = [id, name, email]
        return userEntity
    }
}
