//
//  MoviesMenu.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import SwiftUI

struct MoviesMenu: View {
    var menuTitle: String
    var media: [MediaUI]

    var body: some View {
        VStack {
            HStack {
                Text(menuTitle)
                    .bold()
                    .font(.title2)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(media) { movie in
                        VStack {
                            AsyncImage(url: URL(string: movie.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 100)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                            Text(movie.title)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .frame(width: 100)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(alignment: .topLeading)
        .padding()
    }
}
