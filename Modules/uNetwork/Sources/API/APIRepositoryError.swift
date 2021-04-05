//
//  APIRepositoryError.swift
//  
//
//  Created by Mateus Sousa on 28/12/20.
//

import Foundation

enum APIRepositoryError {
    case urlInvalid
    case noConnection
    case generic
}

extension APIRepositoryError: Error {
    var localizedDescription: String {
        switch self {
        case .urlInvalid:
            return ""
        case .noConnection:
            return "Você parece está sem conexão, verifique e tente novamente."
        case .generic:
            return "Error inesperado, tente novamente."
        }
    }
}
