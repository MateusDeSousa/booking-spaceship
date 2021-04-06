//
//  AuthCoordinator.swift
//  
//
//  Created by Mateus Sousa on 05/04/21.
//

import Foundation
import uCore

class AuthCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]
    var navigator: Navigator
    
    init() {
        childCoordinators = [Coordinator]()
        navigator = Navigator()
    }
    
    func start() {
        
    }
    
    func remove() {
        
    }
    
}
