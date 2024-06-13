//
//  AdsService.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation

final class AdsService: AdsServiceProtocol {
    
    private let networkClient: NetworkClientProtocol
    
    private var path: String {
        // Base URL for Leboncoin API
        let absolutePath =  "https://raw.githubusercontent.com/leboncoin/paperclip/master"
        return absolutePath+"/listing.json"
    }
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchAds() async throws -> [AdDTO] {
        if let url = URL(string: path) {
            let data  = try await networkClient.makeAPICall(url: url)
            return try JSONDecoder().decode([AdDTO].self, from: data)
        }
        return []
    }
}
