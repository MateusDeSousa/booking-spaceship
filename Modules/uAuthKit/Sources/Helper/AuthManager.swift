//
//  AuthManager.swift
//  
//
//  Created by Mateus Sousa on 29/12/20.
//

import Foundation
import uCore

public struct AuthManager {
    
    public init() {
        DatabaseController.initialize()
    }
    
    public func isLogged() -> Bool {
        do {
            let user = try DatabaseController.fetch(type: User.self)?.first
            return user != nil
        } catch  {
            return false
        }
    }
    
    public func saveUser(_ auth: UserAuth) {
        let user = User(context: DatabaseController.persistentContainer.viewContext)
        user.id = UUID()
        user.name = auth.userName
        user.email = auth.userEmail
        
        DatabaseController.saveContext()
    }
}
