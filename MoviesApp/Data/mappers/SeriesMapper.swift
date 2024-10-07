//
//  SeriesMapper.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

func SeriesDTOToMediaUI(remoteSeries: [SeriesDto]) -> [MediaUI] {
    return remoteSeries.map { remoteSerie in
        MediaUI(
            id: remoteSerie.id,
            image: "https://image.tmdb.org/t/p/w500/" + remoteSerie.posterPath,
            title: remoteSerie.name,
            rating: String(remoteSerie.voteAverage),
            date: remoteSerie.firstAirDate
        )
    }
}

func seriesDBToMediaUI(remoteSerie: SeriesDB?) -> MediaUI? {
    guard let remoteSerie = remoteSerie else {
        return nil
    }

    return MediaUI(
        id: Int(remoteSerie.id),
        image: "https://image.tmdb.org/t/p/w500/" + (remoteSerie.posterPath),
        title: remoteSerie.name,
        rating: String(format: "%.1f", remoteSerie.voteAverage),
        date: remoteSerie.firstAirDate
    )
}

func seriesDTOToMovieDB(remoteSeries: [SeriesDto], category: MediaCategory) -> [SeriesDB] {
    return remoteSeries.map { dto in
        SeriesDB(
            id: Int64(dto.id),
            backdropPath: dto.backdropPath,
            firstAirDate: dto.firstAirDate,
            genreIds: dto.genreIds,
            name: dto.name,
            originCountry: dto.originCountry,
            originalLanguage: dto.originalLanguage,
            originalName: dto.originalName, overview: dto.overview,
            popularity: dto.popularity, posterPath: dto.posterPath,
            voteAverage: dto.voteAverage,
            voteCount: Int64(dto.voteCount),
            category: category.rawValue
        )
    }
}

func seriesDBToMediaUI(localSeries: [SeriesDB]) -> [MediaUI] {
    return localSeries.map { localSerie in
        MediaUI(
            id: Int(localSerie.id),
            image: "https://image.tmdb.org/t/p/w500/" + localSerie.posterPath,
            title: localSerie.name,
            rating: String(localSerie.voteAverage),
            date: localSerie.firstAirDate
        )
    }
}
