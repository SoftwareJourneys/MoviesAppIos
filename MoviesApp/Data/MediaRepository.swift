//
//  MediaRepository.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

class MediaRepository {
    
    static let shared = MediaRepository(movieService: MoviesService.shared, seriesService: SeriesService.shared)
    
    let movieService: MoviesServiceProtocol
    let seriesService: SeriesServiceProtocol
    
    init(movieService: MoviesServiceProtocol, seriesService: SeriesServiceProtocol) {
        self.movieService = movieService
        self.seriesService = seriesService
    }
    
    func getListOfMovies(category: MediaCategory)async throws -> [MovieDto] {
        switch category {
               case .popular:
                   return try await movieService.getPopularMovies()
               case .topRated:
                   return try await movieService.getTopRatedMovies()
               }
        }
    
    func getListOfSeries(category: MediaCategory)async throws -> [SeriesDto]  {
        switch category {
               case .popular:
                   return try await seriesService.getPopularSeries()
               case .topRated:
                   return try await seriesService.getTopRatedSeries()
               }
    }
    
    func getMovieById(id: String){
        // Add logic with db
    }
    
    func getSerieById(id: String){
        // Add logic with db
    }
}
