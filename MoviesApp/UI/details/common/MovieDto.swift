
import Foundation
 
struct MovieDto: Decodable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originCountry: [String]?
    let originalLanguage: String
    let originalName: String  //SI
    let overview: String  //SI
    let popularity: Double //SI
    let posterPath: String //SI
    let firstAirDate: String //SI
    let name: String
    let voteAverage: Double
    let voteCount: Int
 
    enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIds = "genre_ids"
            case id
            case originCountry = "origin_country"
            case originalLanguage = "original_language"
            case originalName = "original_title"
            case overview
            case popularity
            case posterPath = "poster_path"
            case firstAirDate = "release_date"
            case name = "title"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
    }
}
 
 
import Foundation
 
 
struct SeriesDto: Decodable {
    let backdropPath: String?
    let firstAirDate: String
    let genreIds: [Int]
    let id: Int
    let name: String
    let originCountry: [String]?
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int
 
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIds = "genre_ids"
        case id
        case name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

