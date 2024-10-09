//
//  MediaScrollView.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct MediaScrollView : View {
    
    var viewModel : MediaViewModel
    var media : [MediaUI]
    var loadMoreAction: () -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            if viewModel.isConnected {
                HStack() {
                    ForEach(media) { movie in
                        MediaView(media: movie)
                    }
                    Button(action: {
                        loadMoreAction()
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 40))
                            .padding()
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
            } else {
                HStack(spacing: 20) {
                    ForEach(media) { movie in
                        MediaView(media: movie)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
