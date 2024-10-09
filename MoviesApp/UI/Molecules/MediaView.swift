//
//  MovieView.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import SwiftUI

struct MediaView: View {
    @EnvironmentObject var viewModel: MediaViewModel
    var media: MediaUI

    var body: some View {
       
        NavigationLink(destination: DetailedView(previewMovieId: media.id, isSerie: viewModel.isSerie(movie: media))) {
            VStack {
                AsyncImage(url: URL(string: media.image)) { phase in
                    if let image = phase.image {
                        MediaImageViewOnline(image: image)
                    } else if phase.error != nil {
                        MediaImageViewOffline(title: media.title)
                    } else {
                        ProgressView()
                            .frame(width: 100, height: 160)
                    }
                }
            }
        }
    }
}
