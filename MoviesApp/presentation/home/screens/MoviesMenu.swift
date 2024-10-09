//
//  MoviesMenu.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import SwiftUI

struct MoviesMenu: View {
    @EnvironmentObject var viewModel: MediaViewModel
    var menuTitle: String
    var media: [MediaUI]
    var loadMoreAction: () -> Void
    
    var body: some View {
        VStack {
            HeaderMenuTitle(menuTitle: menuTitle)
            ScrollView(.horizontal, showsIndicators: false) {
                if viewModel.isConnected {
                    HStack() {
                        ForEach(media) { movie in
                            MovieView(movie: movie)
                        }
                    }
                    .padding(.horizontal)
                } else {
                    HStack(spacing: 20) {
                        ForEach(media) { movie in
                            MovieView(movie: movie)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .accessibilityIdentifier("MoviesMenu")
        }
        .frame(alignment: .topLeading)
        .padding()
    }
}
