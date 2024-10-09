//
//  MovieMapper.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

extension MovieDto {
    func toDomain() -> MediaUI {
        return MediaUI(
            id: self.id,
            image: "https://image.tmdb.org/t/p/w500/" + self.posterPath,
            title: self.name,
            rating: String(self.voteAverage),
            date: self.firstAirDate
        )
    }
    
    func toDb(category: MediaCategory) -> MovieDB {
        return MovieDB(
            id: Int64(self.id),
            adult: self.adult,
            backdropPath: self.backdropPath,
            genreIds: self.genreIds,
            originalLanguage: self.originalLanguage,
            originalTitle: self.originalName,
            overview: self.overview,
            popularity: self.popularity,
            posterPath: self.posterPath,
            releaseDate: self.firstAirDate,
            title: self.name,
            voteAverage: self.voteAverage,
            voteCount: Int64(self.voteCount),
            category: category.rawValue
        )
    }
}

extension MovieDB {
    func toDomain() -> MediaUI {
        MediaUI(
            id: Int(self.id),
            image: "https://image.tmdb.org/t/p/w500/" + (self.posterPath ?? ""),
            title: self.title,
            rating: String(self.voteAverage),
            date: self.releaseDate
        )
    }
}
