//
//  MediaRepository.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

class MediaRepository {
    
    static let shared = MediaRepository(
        movieService: MoviesService.shared,
        seriesService: SeriesService.shared,
        seriesDB: SeriesDatabaseManager.shared,
        moviesDB: MoviesDatabaseManager.shared
    )
    
    let movieService: MoviesServiceProtocol
    let seriesService: SeriesServiceProtocol
    let moviesDB: MoviesDatabaseManager
    let seriesDB: SeriesDatabaseManager
    
    init(movieService: MoviesServiceProtocol, seriesService: SeriesServiceProtocol, seriesDB: SeriesDatabaseManager, moviesDB: MoviesDatabaseManager) {
        self.movieService = movieService
        self.seriesService = seriesService
        self.moviesDB = moviesDB
        self.seriesDB = seriesDB
    }
    
    func getListOfMovies(category: MediaCategory)async throws -> [MovieDto] {
        switch category {
        case .popular:
            return try await getPopularMovies()
        case .topRated:
            return try await movieService.getTopRatedMovies()
        }
    }
    
    private func getPopularMovies()async throws -> [MovieDto]{
        let remoteMovies = try await  movieService.getPopularMovies()
        
        await moviesDB.saveMovies(movies: moviesDTOToMovieDB(remoteMovies: remoteMovies, category: MediaCategory.popular))
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
