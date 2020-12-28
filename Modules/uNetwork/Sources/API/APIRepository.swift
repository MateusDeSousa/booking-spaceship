//
//  APIRepository.swift
//  
//
//  Created by Mateus Sousa on 28/12/20.
//

import Foundation

struct APIRepository {
    
    private let baseURL = "https://5fea30808ede8b0017ff1748.mockapi.io/api/v1"
    
    public func getAvailableCars(completion: @escaping (Result<Data, Error>) -> Void) {
        let endPoint = "/available-cars"
        
        if let url = URL(string: baseURL + endPoint) {
            do {
                let data = try Data(contentsOf: url)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }else {
            completion(.failure(APIRepositoryError.urlInvalid))
        }
    }
}
