import Foundation
import SwiftData

@Model
class SeriesDB {
    @Attribute(.unique) var id: Int64
    var backdropPath: String?
    var firstAirDate: String
    var genreIds: [Int]
    var name: String
    var originCountry: [String]?
    var originalLanguage: String
    var originalName: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var voteAverage: Double
    var voteCount: Int64
    var category: String

    init(id: Int64,
         backdropPath: String?,
         firstAirDate: String,
         genreIds: [Int],
         name: String,
         originCountry: [String]?,
         originalLanguage: String,
         originalName: String,
         overview: String,
         popularity: Double,
         posterPath: String,
         voteAverage: Double,
         voteCount: Int64,
         category: String) {
        self.id = id
        self.backdropPath = backdropPath
        self.firstAirDate = firstAirDate
        self.genreIds = genreIds
        self.name = name
        self.originCountry = originCountry
        self.originalLanguage = originalLanguage
        self.originalName = originalName
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.category = category
    }
}
