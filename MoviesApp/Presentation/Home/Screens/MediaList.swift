//
//  MoviesMenu.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import SwiftUI

struct MediaList: View {
    @EnvironmentObject var viewModel: MediaViewModel
    var menuTitle: String
    var media: [MediaUI]
    var loadMoreAction: () -> Void
    
    var body: some View {
        VStack {
            HeaderMenuTitle(menuTitle: menuTitle)
            MediaScrollView(viewModel: viewModel, media: media, loadMoreAction: loadMoreAction)
        }
        .accessibilityIdentifier("MediaList")
        .frame(alignment: .topLeading)
        .padding()
    }
}
