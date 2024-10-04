import Foundation
import SwiftUI

struct moviesMenu: View {
    var menuTitle: String
    
    var body: some View {
        VStack {
            HStack {
                Text(menuTitle)
                    .bold()
                    .font(.title2)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    let movies = previewMokedMovies
                    ForEach(movies) { movie in
                        VStack {
                            AsyncImage(url: URL(string: movie.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 100)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                            Text(movie.title)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .frame(width: 100)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(alignment: .topLeading)
        .padding()
    }
}
