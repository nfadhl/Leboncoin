//
//  AdsListView.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import SwiftUI

struct AdsListView: View {
    @StateObject private var adsListViewModel = AdsListViewModel(networkClient: NetworkClient())
    @State private var selectedAd: AdViewModel?
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HeaderView(title: "Ads")
                ScrollView{
                    LazyVStack(spacing: 30){
                        ForEach(adsListViewModel.adsViewModel){ adViewModel in
                            NavigationLink {
                                AdDetailsView(adDetailsVM: AdDetailsViewModel(adViewModel: adViewModel))
                            } label: {
                               AdView(ad: adViewModel)
                            }
                        }
                    }
                    .padding()
                    
                }
            }
        }
    }
}

struct HeaderView: View {
    var title: String
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(height: 50)
    }
}


