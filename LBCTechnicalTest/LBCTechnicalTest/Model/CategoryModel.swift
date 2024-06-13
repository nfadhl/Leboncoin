//
//  CategoryModel.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation

struct CategoryModel {
    let categoryID: Int
    let name: String
    
    init(category: CategoryDTO) {
        self.categoryID = category.categoryID
        self.name = category.name
    }
}
