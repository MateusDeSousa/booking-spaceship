//
//  NetworkProtocol.swift
//  
//
//  Created by Mateus Sousa on 27/02/21.
//

import Foundation

public protocol NetworkProtocol {
    
    typealias Parameters = Any
    
    var endpoint: URL? { get }
    var method: HttpMethod { get }
    var parameters: Parameters? { get }
    
    func load<T>(type: T.Type, callback: @escaping (Result<T, Error>) -> Void)
    func load<T>(type: T.Type, callback: @escaping (Result<[T], Error>) -> Void)
    func buildRequest() throws -> URLRequest
    
}

public extension NetworkProtocol {
    
    func load<T>(type: T.Type, callback: @escaping (Result<T, Error>) -> Void) {
        fatalError("load not implemented")
    }
    
    func load<T>(type: T.Type, callback: @escaping (Result<[T], Error>) -> Void) {
        fatalError("load not implemented")
    }
    
    var method: HttpMethod { .GET }
    var parameters: Parameters? { nil }
    
    func buildRequest() throws -> URLRequest {
        guard let url = endpoint else {
            throw APIRepositoryError.urlInvalid
        }
        
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        guard let parameters = parameters else { return urlRequest as URLRequest}
        let httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        urlRequest.httpBody = httpBody
        return urlRequest as URLRequest
    }
    
}
