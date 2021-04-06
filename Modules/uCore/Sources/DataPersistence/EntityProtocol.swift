//
//  EntityProtocol.swift
//  
//
//  Created by Mateus Sousa on 05/04/21.
//

import Foundation
import CoreData

public protocol EntityProtocol {
    static var identifier: String { get }
    static func createEntity() -> NSEntityDescription
    static func request() -> NSFetchRequest<NSManagedObject>
}

public extension EntityProtocol {
    static var identifier: String {
        String(describing: Self.self)
    }
    
    static func request() -> NSFetchRequest<NSManagedObject> {
        NSFetchRequest<NSManagedObject>(entityName: User.identifier)
    }
}
