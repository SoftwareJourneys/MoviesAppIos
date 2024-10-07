//
//  PreviewMenu.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import SwiftUI

struct PreviewMenu: View {
    var media: [MovieUI]
    var body: some View {
        VStack {
            HStack {
                Text("Previews")
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
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
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
        .padding()
    }
}
