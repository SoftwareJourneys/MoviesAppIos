//
//  MovieMapper.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

func moviesDTOToMovieUI(remoteMovies: [MovieDto]) -> [MovieUI] {
    return remoteMovies.map { remoteMovie in
        MovieUI(
            id: remoteMovie.id,
            image: "https://image.tmdb.org/t/p/w500/" + remoteMovie.posterPath,
            title: remoteMovie.name,
            rating: String(remoteMovie.voteAverage),
            date: remoteMovie.firstAirDate
        )
    }
}
