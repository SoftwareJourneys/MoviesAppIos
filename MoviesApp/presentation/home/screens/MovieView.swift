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
                    if let image = phase.image {
                        MovieImageViewOnline(image: image)
                    } else if phase.error != nil {
                        VStack {
                            NoAvailableImageView()
                            MovieTitleViewOffline(title : movie.title)
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

