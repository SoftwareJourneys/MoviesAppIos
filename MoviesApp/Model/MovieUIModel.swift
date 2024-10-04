import Foundation

struct MovieUI: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var title: String
    var rating: String
    var date: String
    var isFavorite: Bool = false
}
