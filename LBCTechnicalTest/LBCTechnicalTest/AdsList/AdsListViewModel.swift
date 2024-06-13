//
//  AdsListViewModel.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation
import Combine

@MainActor
final class AdsListViewModel: ObservableObject {
    
    @Published var adsViewModel = [AdViewModel]()
    private let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
        CategoriesRepository.shared.loadAllCategories()
        fetchAds()
    }
    
    // Fetches ads using the LBCAPIClient, converts them into AdViewModel, sorts them by date
    func fetchAds() {
        Task {
            do {
                let ads = try await AdsService(networkClient: networkClient).fetchAds()
                ads.forEach { adsViewModel.append(AdViewModel(ad: AdModel(ad: $0))) }
                self.adsViewModel = sortedAdsByDate(ads: self.adsViewModel)
            } catch {
                // Handle the error
                print("Error fetching ads: \(error)")
            }
        }
    }
    
    // Sorting the ads by date
    func sortedAdsByDate(ads: [AdViewModel]) -> [AdViewModel] {
        return ads.sorted { (firstAd, secondAd) -> Bool in
                return firstAd.creationDate > secondAd.creationDate
        }
    }
}

