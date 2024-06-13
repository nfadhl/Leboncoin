//
//  CategoriesService.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation

final class CategoriesService: CategoriesServiceProtocol {
    
    private let networkClient: NetworkClientProtocol
    
    
    private var path: String {
        // Base URL for Leboncoin API
        let absolutePath =  "https://raw.githubusercontent.com/leboncoin/paperclip/master"
        return absolutePath+"/categories.json"
    }
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchCategories() async throws -> [CategoryDTO] {
         if let url = URL(string: path) {
            let data  = try await networkClient.makeAPICall(url: url)
            let categories: [CategoryDTO] = try JSONDecoder().decode([CategoryDTO].self, from: data)
            return categories
        } else {
            return []
        }
    }
}
