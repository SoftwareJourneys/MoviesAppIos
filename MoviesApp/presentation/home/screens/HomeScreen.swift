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
                PopularMediaSponsor(movie: viewModel.popularMovies.first)
                MediaList(menuTitle: "Top rated movies", media: viewModel.topRatedMovies, loadMoreAction: {
                    viewModel.fetchTopRatedMovies()
                })
                MediaList(menuTitle: "Popular Movies", media: viewModel.popularMovies, loadMoreAction: {
                    viewModel.fetchPopularMovies()
                })
                MediaList(menuTitle: "Top rated series", media: viewModel.topRatedSeries, loadMoreAction: {
                    viewModel.fetchTopRatedSeries()
                })
                MediaList(menuTitle: "Popular series", media: viewModel.popularSeries, loadMoreAction: {
                    viewModel.fetchPopularSeries()
                })
            }
        }
        .accessibilityIdentifier("HomeScreen")
    }
}

