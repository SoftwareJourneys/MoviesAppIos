import Foundation
import SwiftUI

@MainActor
struct homeView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    popularMediaSponsor()
                    moviesMenu(menuTitle: "Previews", movies: previewMokedMovies, isCircular: true)
                    moviesMenu(menuTitle: "Top rated movies", movies: previewMokedMovies, isCircular: false)
                    moviesMenu(menuTitle: "Favorite movies", movies: previewMokedMovies, isCircular: false)
                    moviesMenu(menuTitle: "Top rated series", movies: previewMokedMovies, isCircular: false)
                    moviesMenu(menuTitle: "Favorite series", movies: previewMokedMovies, isCircular: false)
                }
            }
            .background(.black)
        }
    }
}
