//
//  APIRepositoryError.swift
//  
//
//  Created by Mateus Sousa on 28/12/20.
//

import Foundation

enum APIRepositoryError {
    case urlInvalid
}

extension APIRepositoryError: Error {
    var localizedDescription: String {
        switch self {
        case .urlInvalid:
            return ""
        }
    }
}
