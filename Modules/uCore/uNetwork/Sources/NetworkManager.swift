//
//  NetworkManager.swift
//  
//
//  Created by Mateus Sousa on 28/12/20.
//

import Foundation

public struct NetworkManager {
    
    public init() {}
    
    public func getAvailableCars(completion: @escaping (Result<Data, Error>) -> Void) {
        let api = APIRepository()
        api.getAvailableCars(completion: completion)
    }
}
