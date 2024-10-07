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
    var menuTitle: String = "Continue watching"
    var body: some View {
        ScrollView {
            VStack {
                PopularMediaSponsor()
                PreviewMenu()
                MoviesMenu(menuTitle: "Top rated movies")
                MoviesMenu(menuTitle: "Favorite movies")
                MoviesMenu(menuTitle: "Top rated series")
                MoviesMenu(menuTitle: "Favorite series")
            }
        }
    }
}
