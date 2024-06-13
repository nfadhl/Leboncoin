//
//  AdsServiceProtocol.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation

protocol AdsServiceProtocol {
    // Fetches a list of ads from the Leboncoin API
    func fetchAds() async throws -> [AdDTO]
}
