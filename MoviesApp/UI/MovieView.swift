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
       
        NavigationLink(destination: DetailedView(previewMovieId: movie.id, isSerie: viewModel.isSerie(movie: movie))) {
            VStack {
                AsyncImage(url: URL(string: movie.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 100, height: 160)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 160)
                            .clipShape(Rectangle())
                    case .failure:
                        GeometryReader { geometry in
                            ZStack {
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                                    .foregroundColor(.gray)

                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                                    .offset(x: geometry.size.width * 0.4, y: -geometry.size.height * 0.4 + 35)
                            }
                        }
                        .frame(width: 100, height: 160)
                    @unknown default:
                        EmptyView()
                    }
                }

                if !viewModel.isConnected {
                    Text(movie.title)
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(.top, 8)
                }
            }
        }
    }
}

