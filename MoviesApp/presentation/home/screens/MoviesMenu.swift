import Foundation
import SwiftUI

struct MoviesMenu: View {
    @EnvironmentObject var viewModel: MediaViewModel
    var menuTitle: String
    var media: [MediaUI]
    var loadMoreAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(menuTitle)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                if viewModel.isConnected {
                    HStack() {
                        ForEach(media) { movie in
                            MovieView(movie: movie)
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
