//
//  GetAvailableCarsService.swift
//  
//
//  Created by Mateus Sousa on 27/02/21.
//

import Foundation
import uNetwork

struct GetAvailableCarsService: NetworkProtocol {
    
    
    
    var endpoint: URL? {
        URL(string: "https://5fea30808ede8b0017ff1748.mockapi.io/api/v1")
    }
    var method: HttpMethod = .GET
    var parameters: Parameters? = nil
    
    func load<Model: Decodable>(callback: @escaping (Result<[Model], Error>) -> Void) {
        let semaphore = DispatchSemaphore(value: 1)
        var response: URLSessionResponse!
        do {
            let urlRequest = try buildRequest()
            
            semaphore.wait()
            URLSession(configuration: .default).dataTask(with: urlRequest, completion: {
                response = $0
                semaphore.signal()
            })
            
            semaphore.wait()
            let data = try response.getData()
            let cars = try JSONDecoder().decode([Model].self, from: data)
            callback(.success(cars))
            semaphore.signal()
        } catch {
            callback(.failure(error))
        }
    }
}
