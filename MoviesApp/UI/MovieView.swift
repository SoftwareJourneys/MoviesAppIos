//
//  MovieView.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import SwiftUI

struct MovieView: View {

    var movie: MediaUI

    var body: some View {
        NavigationLink(destination: DetailedView(movieTitle: movie.title)) {
            VStack {
                AsyncImage(url: URL(string: movie.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height:  160)
                        .clipShape(Rectangle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 160)
                }
            }
        }
    }
}
