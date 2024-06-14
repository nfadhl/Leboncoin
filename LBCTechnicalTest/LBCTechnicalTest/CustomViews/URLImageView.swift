//
//  URLImageView.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 13/06/2024.
//

import Foundation
import SwiftUI

struct URLImageView: View {
    @StateObject private var loader: ImageLoader
    var placeholder: Image

    init(urlString: String, placeholder: Image = Image(systemName: "photo")) {
        _loader = StateObject(wrappedValue: ImageLoader(urlString: urlString))
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
    }

    private var image: Image {
        if let uiImage = loader.image {
            return Image(uiImage: uiImage)
        } else {
            return placeholder
        }
    }
}
