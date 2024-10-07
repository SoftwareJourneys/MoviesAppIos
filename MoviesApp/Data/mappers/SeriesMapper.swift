//
//  SeriesMapper.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

func SeriesDTOToMovieUI(remoteMovies: [SeriesDto]) -> [MovieUI] {
    return remoteMovies.map { remoteSerie in
        MovieUI(
            id: remoteSerie.id,
            image: "https://image.tmdb.org/t/p/w500/" + remoteSerie.posterPath,
            title: remoteSerie.name,
            rating: String(remoteSerie.voteAverage),
            date: remoteSerie.firstAirDate
        )
    }
}

