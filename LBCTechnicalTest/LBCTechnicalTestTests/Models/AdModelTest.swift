//
//  AdModelTest.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 13/06/2024.
//

import XCTest

@testable import LBCTechnicalTest

final class AdTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testAdModel() async {
        //Given
        let mockAdsService = MockAdsService()
        let apiClient = AdsService(networkClient: mockAdsService)
        let ad = try? await apiClient.fetchAds().first!
    
        //When
        let adModel = AdModel(ad: ad!)
        
        //Then
        XCTAssertEqual(adModel.adID, 1461267313)
        XCTAssertEqual(adModel.title, "Statue homme noir assis en plâtre polychrome")
        XCTAssertEqual(adModel.isUrgent,false)
    }

}

