//
//  AdDetailsView.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import SwiftUI

struct AdDetailsView: View {
    
    @StateObject var adDetailsVM: AdDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ZStack(alignment: .topLeading) {
                    URLImageView(urlString: adDetailsVM.image)
                        .clipped()
                    if adDetailsVM.isUrgent {
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
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("**\(adDetailsVM.title)**")
                    Text("**\(adDetailsVM.price)**")
                    Text(adDetailsVM.creationDate)
                    Text(adDetailsVM.categoryName)
                    if let siret = adDetailsVM.siret{
                        HStack {
                            Text("**Siret: **")
                            Text(siret)
                        }
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 5) {
                        Text("**Description**")
                        Text(adDetailsVM.description)
                    }
                }
                .padding(.horizontal,10)
            }
        }

    }
}
