//
//  URLSessionExtension.swift
//  
//
//  Created by Mateus Sousa on 27/02/21.
//

import Foundation

public extension URLSession {
    
    @discardableResult
    func dataTask(with urlRequest: URLRequest, completion: @escaping (URLSessionResponse) -> Void) -> URLSessionDataTask {
        dataTask(with: urlRequest, completionHandler: { completion(URLSessionResponse(data: $0, response: $1, error: $2)) })
    }
    
}
