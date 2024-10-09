//
//  SeriesMapper.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

extension SeriesDto {
    
    func toDomain() -> MediaUI {
        return MediaUI(
            id: self.id,
            image: "https://image.tmdb.org/t/p/w500/" + self.posterPath,
            title: self.name,
            rating: String(self.voteAverage),
            date: self.firstAirDate
        )
    }
    
    func toDb(category: MediaCategory) -> SeriesDB {
        return SeriesDB(
            id: Int64(self.id),
            backdropPath: self.backdropPath,
            firstAirDate: self.firstAirDate,
            genreIds: self.genreIds,
            name: self.name,
            originCountry: self.originCountry,
            originalLanguage: self.originalLanguage,
            originalName: self.originalName,
            overview: self.overview,
            popularity: self.popularity,
            posterPath: self.posterPath,
            voteAverage: self.voteAverage,
            voteCount: Int64(self.voteCount),
            category: category.rawValue
        )
    }
}

extension SeriesDB {
    func toDomain() -> MediaUI {
        MediaUI(
            id: Int(self.id),
            image: "https://image.tmdb.org/t/p/w500/" + self.posterPath,
            title: self.name,
            rating: String(self.voteAverage),
            date: self.firstAirDate
        )
    }
}
