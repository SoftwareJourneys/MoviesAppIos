//
//  HomeBar.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import Foundation
import SwiftUI


@MainActor
struct HomeBar: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SearchScreen()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            ComingSoonScreen()
                .tabItem {
                    Label("Coming Soon", systemImage: "clock")
                }

            DownloadsScreen()
                .tabItem {
                    Label("Downloads", systemImage: "arrow.down.circle")
                }

            MoreScreen()
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
        }
        .accentColor(.white)
    }
}
