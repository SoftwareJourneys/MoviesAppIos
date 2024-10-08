//
//  MediaRepository.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import Combine
import Network

class MediaRepository {
    
    let movieService: MoviesServiceProtocol
    let seriesService: SeriesServiceProtocol
    let moviesDB: MoviesDatabaseProtocol
    let seriesDB: SeriesDatabaseProtocol
    
    static let shared = MediaRepository(movieService: MoviesService.shared, seriesService: SeriesService.shared, seriesDB: SeriesDatabaseManager.shared,
                                        moviesDB: MoviesDatabaseManager.shared
    )
    
    init(
        movieService: MoviesServiceProtocol,
        seriesService: SeriesServiceProtocol,
        seriesDB: SeriesDatabaseProtocol,
        moviesDB: MoviesDatabaseProtocol
    ) {
        self.movieService = movieService
        self.seriesService = seriesService
        self.moviesDB = moviesDB
        self.seriesDB = seriesDB
    }
    
    func getListOfMovies(category: MediaCategory, page: Int) async -> [MediaUI] {
        
        do {
            
            return try await  handleMovieRemoteSource(category, page)
            
        } catch {
            
            return await handleMovieLocalSource(category)
            
        }
        
    }
    
    
    fileprivate func handleMovieRemoteSource(_ category: MediaCategory, _ page: Int) async throws -> [MediaUI] {
        
        let remoteMovies = try await self.getMovies(for: category, page: page)
        
        if(page <= 5){
            await self.moviesDB.saveMovies(movies: remoteMovies.map{ movie in
                movie.toDb(category: category)
            })
        }
        
        let remoteMediaUI = remoteMovies.map{ movie in
            movie.toDomain()
        }
        
        return remoteMediaUI
    }
    
    
    
    fileprivate func handleMovieLocalSource(
        _ category: MediaCategory
    ) async -> [MediaUI] {
        
        let localMovies = await moviesDB.getMoviesByCategory(category: category.rawValue)
        
        if(!localMovies.isEmpty){
            var sortedMovies: [MovieDB] = []
            
            switch category{
            case .popular:
                sortedMovies = localMovies.sorted { $0.popularity > $1.popularity }
            case .topRated:
                sortedMovies = localMovies.sorted { $0.voteAverage > $1.voteAverage }
            }
            
            let localMediaUI = sortedMovies.map{ movie in
                movie.toDomain()
            }
            
            return localMediaUI
        }
        
        return []
    }
    
    
    
    private func getMovies(for category: MediaCategory, page: Int) async throws -> [MovieDto] {
        switch category {
        case .popular:
            return try await movieService.getPopularMovies(page: page)
        case .topRated:
            return try await movieService.getTopRatedMovies(page: page)
        }
    }
    
    func getListOfSeries(category: MediaCategory, page: Int) async -> [MediaUI] {
        do {
            
            return try await  handleSerieRemoteSource(category, page)
            
        } catch {
            
            return await handleSerieLocalSource(category)
            
        }
        
    }
    
    
    fileprivate func handleSerieLocalSource(_ category: MediaCategory) async -> [MediaUI] {
        let localSeries = await seriesDB.getSeriesByCategory(category: category.rawValue)
        
        if(!localSeries.isEmpty){
            var sortedSeries: [SeriesDB] = []
            
            switch category{
            case .popular:
                sortedSeries = localSeries.sorted { $0.popularity > $1.popularity }
            case .topRated:
                sortedSeries = localSeries.sorted { $0.voteAverage > $1.voteAverage }
            }
            
            let localMediaUI = sortedSeries.map{ serie in
                serie.toDomain()
            }
            return localMediaUI
        }
        return []
    }
    
    fileprivate func handleSerieRemoteSource(_ category: MediaCategory, _ page: Int) async throws -> [MediaUI] {
        let remoteSeries = try await self.getSeries(for: category, page: page)
        
        if(page <= 5){
            await self.seriesDB.saveSeries(
                series: remoteSeries.map{ serie in
                    serie.toDb(category: category)
                }
            )
        }
        
        let remoteMediaUI = remoteSeries.map{ serie in
            serie.toDomain()
        }
        return remoteMediaUI
    }
    
    private func getSeries(for category: MediaCategory, page: Int) async throws -> [SeriesDto] {
        switch category {
        case .popular:
            return try await seriesService.getPopularSeries(page: page)
        case .topRated:
            return try await seriesService.getTopRatedSeries(page: page)
        }
    }
    
}
