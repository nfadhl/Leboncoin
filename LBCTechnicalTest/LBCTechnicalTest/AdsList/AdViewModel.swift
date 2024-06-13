//
//  AdViewModel.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation

final class AdViewModel: Identifiable {
    var ad: AdModel
    var adID: Int
    var title: String
    var categoryName: String
    var creationDate: String
    var price: String
    var image: String
    var isUrgent: Bool
    
    init(ad: AdModel) {
        self.ad = ad
        self.adID = ad.adID
        self.title = ad.title
        self.image = ad.image
        self.isUrgent = ad.isUrgent
        self.price = ad.price.formatted(.currency(code: "EUR"))
        self.creationDate = ad.creationDate.convertDateString() ?? ""
        self.categoryName = CategoriesManager.shared.categories.first(where: { $0.categoryID == ad.categoryID })?.name ?? ""
    }
}
