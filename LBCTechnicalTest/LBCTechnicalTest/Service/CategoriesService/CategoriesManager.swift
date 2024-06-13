//
//  CategoriesManager.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation
final class CategoriesManager: NSObject {

    static let shared = CategoriesManager()

    var categories: [CategoryDTO] = []

    func loadAllCategories() {
        Task {
            self.categories = try await CategoriesService(networkClient: NetworkClient()).fetchCategories()
        }
    }
}
