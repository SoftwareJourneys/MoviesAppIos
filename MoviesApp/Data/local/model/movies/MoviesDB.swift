import SwiftData

@Model
class MovieDB {
    @Attribute(.unique) var id: Int64
    var adult: Bool
    var backdropPath: String?
    var genreIds: [Int]
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String?
    var releaseDate: String
    var title: String
    var voteAverage: Double
    var voteCount: Int64
    var category: String

    init(
        id: Int64,
         adult: Bool,
         backdropPath: String?,
         genreIds: [Int],
         originalLanguage: String,
         originalTitle: String,
         overview: String,
         popularity: Double,
         posterPath: String?,
         releaseDate: String,
         title: String,
         voteAverage: Double,
         voteCount: Int64,
         category: String) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.category = category
    }
}
