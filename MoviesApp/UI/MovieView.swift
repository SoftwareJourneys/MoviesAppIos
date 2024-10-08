//
//  MovieView.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import SwiftUI

struct MovieView: View {
    @EnvironmentObject var viewModel: MediaViewModel
    var movie: MediaUI

    var body: some View {
        NavigationLink(destination: DetailedView(movieTitle: movie.title)) {
            VStack {
                AsyncImage(url: URL(string: movie.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 160)
                            .clipShape(Rectangle())
                    } else if phase.error != nil {
                        VStack {
                            ZStack {
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 70)
                                    .foregroundColor(.gray)

                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                                    .offset(x: 35, y: -30)
                            }
                            .frame(width: 100, height: 100)

                            if !viewModel.isConnected {
                                Text(movie.title)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .frame(width: 100)
                            }
                        }
                    } else {
                        ProgressView()
                            .frame(width: 100, height: 160)
                    }
                }
            }
        }
    }
}
