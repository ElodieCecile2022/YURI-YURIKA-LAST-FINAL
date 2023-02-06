//
//  SuperHeroImageView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// This view will fetch an internet image from a URL.
struct FetchedImageView: View {
    var url: String?
    var body: some View {
        if let url = url {
            AsyncImage(url: URL(string: url)) { phase in
                switch phase {
                case .empty:
                    EmptyView()
                case .success(let image):
                    image
                        .resizable()
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
