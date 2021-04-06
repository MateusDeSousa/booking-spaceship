//
//  AppCoordinator.swift
//  
//
//  Created by Mateus Sousa on 05/04/21.
//

import UIKit

public protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}

public extension Coordinator {
    
    func addChild(_ coordinator: Coordinator) {
        let contains = childCoordinators.contains { $0 === coordinator}
        
        if !contains { childCoordinators.append(coordinator) }
    }
    
    func removeChild(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
}

public class Navigator {
    
//    var navigationController: UINavigationController?
    
    public init() { }
    
}
