//
//  AdView.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import SwiftUI

struct AdView: View {
    let ad: AdViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .topLeading) {
                // Image
                URLImageView(urlString: ad.image)
                    .cornerRadius(10)
                
                if ad.isUrgent {
                    Text("Urgent")
                        .foregroundColor(Color.white)
                        .font(.system(size: 12.0))
                        .padding(5)
                        .background(Color.purple)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 1))
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                }
            }
            Text("**\(ad.title)**")
                .lineLimit(1)
              
            Text(ad.categoryName)
            Text(ad.price)

        }
        .foregroundColor(.black)
    }
}
