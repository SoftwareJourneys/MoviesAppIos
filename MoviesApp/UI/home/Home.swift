import Foundation
import SwiftUI

@MainActor
struct home: View {
    var menuTitle: String = "Continue watching"
    var body: some View {
        ScrollView {
            VStack {
                popularMediaSponsor()
                previewMenu()
                moviesMenu(menuTitle: "Top rated movies")
                moviesMenu(menuTitle: "Favorite movies")
                moviesMenu(menuTitle: "Top rated series")
                moviesMenu(menuTitle: "Favorite series")
            }
        }
    }
}
