//
//  URLSessionResponse.swift
//  
//
//  Created by Mateus Sousa on 27/02/21.
//

import Foundation

public struct URLSessionResponse {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func isOnline() -> Bool {
        return true
    }
    
    public func getData() throws -> Data {
        if let data = data {
            return data
        }else {
            guard let error = error else { throw APIRepositoryError.generic }
            throw error
        }
    }
    
}
