//
//  Movie.swift
//  MoviesApp
//
//  Created by Work on 4/10/24.
//

import Foundation

//struct MovieUI: Identifiable {
//    var id = UUID() // Agrega un identificador único
//    var image: String
//    var title: String
//    var rating: String
//    var date: String
//    var isFavorite: Bool
//}


struct MovieUI: Identifiable {
    var id_ = UUID() // Agrega un identificador único
    var adult: Bool
    var backdropPath: String?
    var genreIds: [Int]
    var id: Int
    var originCountry: [String]?
    var originalLanguage: String
    var originalName: String  //SI
    var overview: String  //SI
    var popularity: Double //SI
    var posterPath: String //SI
    var firstAirDate: String //SI
    var name: String
    var voteAverage: Double
    var voteCount: Int
}

