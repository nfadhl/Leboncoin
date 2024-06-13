//
//  CategoryDTO.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation

struct CategoryDTO: Codable {
     let categoryID: Int
     let name: String
    
     enum CodingKeys: String, CodingKey {
        case categoryID = "id"
        case name
    }
    
}
