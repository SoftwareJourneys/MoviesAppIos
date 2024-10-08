//
//  HomeScreen.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import SwiftUI

@MainActor
struct HomeScreen: View {


    @EnvironmentObject var viewModel: MediaViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    PopularMediaSponsor(movie: viewModel.popularMovies.first)
                    MoviesMenu(menuTitle: "Top rated movies", media: viewModel.topRatedMovies)
                    MoviesMenu(menuTitle: "Popular Movies", media: viewModel.popularMovies)
                    MoviesMenu(menuTitle: "Top rated series", media: viewModel.topRatedSeries)
                    MoviesMenu(menuTitle: "Popular series", media: viewModel.popularSeries)
                }
            }
        }
    }
}
