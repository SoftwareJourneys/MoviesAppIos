//
//  MovieMapper.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

func moviesDTOToMediaUI(remoteMovies: [MovieDto]) -> [MediaUI] {
    return remoteMovies.map { remoteMovie in
        MediaUI(
            id: remoteMovie.id,
            image: "https://image.tmdb.org/t/p/w500/" + remoteMovie.posterPath,
            title: remoteMovie.name,
            rating: String(remoteMovie.voteAverage),
            date: remoteMovie.firstAirDate
        )
    }
}



func moviesDTOToMovieDB(remoteMovies: [MovieDto], category: MediaCategory) -> [MovieDB] {
    return remoteMovies.map { dto in
        MovieDB(
            id: Int64(dto.id),
            adult: dto.adult,
            backdropPath: dto.backdropPath,
            genreIds: dto.genreIds,
            originalLanguage: dto.originalLanguage,
            originalTitle: dto.originalName,
            overview: dto.overview,
            popularity: dto.popularity,
            posterPath: dto.posterPath,
            releaseDate: dto.firstAirDate,
            title: dto.name,
            voteAverage: dto.voteAverage,
            voteCount: Int64(dto.voteCount),
            category: category.rawValue
        )
    }
}

func movieDBToMediaUI(remoteMovie: MovieDB?) -> MediaUI? {
    guard let remoteMovie = remoteMovie else {
        return nil
    }

    return MediaUI(
        id: Int(remoteMovie.id),
        image: "https://image.tmdb.org/t/p/w500/" + (remoteMovie.backdropPath ?? ""),
        title: remoteMovie.title,
        rating: String(remoteMovie.voteAverage),
        date: remoteMovie.releaseDate
    )
}

func moviesDBToMediaUI(localMovies: [MovieDB]) -> [MediaUI] {
    return localMovies.map { localMovie in
        MediaUI(
            id: Int(localMovie.id),
            image: "https://image.tmdb.org/t/p/w500/" + (localMovie.posterPath ?? ""),
            title: localMovie.title,
            rating: String(localMovie.voteAverage),
            date: localMovie.releaseDate
        )
    }
}
