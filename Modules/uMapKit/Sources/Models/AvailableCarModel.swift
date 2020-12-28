//
//  AvailableCarModel.swift
//  
//
//  Created by Mateus Sousa on 28/12/20.
//

import Foundation

struct AvailableCarModel: Decodable, Identifiable, Hashable {
    let id: Int
    let brand: String
    let model: String
    let price: Double
    let latitude: Double
    let longitude: Double
}
