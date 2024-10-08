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
    let moviesDB: MoviesDatabaseManager
    let seriesDB: SeriesDatabaseManager
    let networkMonitor: NetworkMonitorService
    
    
    init(
        movieService: MoviesServiceProtocol,
        seriesService: SeriesServiceProtocol,
        seriesDB: SeriesDatabaseManager,
        moviesDB: MoviesDatabaseManager,
        networkMonitor: NetworkMonitorService
    ) {
        self.movieService = movieService
        self.seriesService = seriesService
        self.moviesDB = moviesDB
        self.seriesDB = seriesDB
        self.networkMonitor = networkMonitor
    }
    
    func getListOfMovies(category: MediaCategory, page: Int) -> AnyPublisher<[MediaUI], Error> {
        let movieSubject = PassthroughSubject<[MediaUI], Error>()
        
        Task {
            var saveIntoDB = false
            
            let localMovies = await moviesDB.getMoviesByCategory(category: category.rawValue)
            
            if(!localMovies.isEmpty && page == 1){
                var sortedMovies: [MovieDB] = []
                switch category{
                case .popular:
                    sortedMovies = localMovies.sorted { $0.popularity > $1.popularity }
                case .topRated:
                    sortedMovies = localMovies.sorted { $0.voteAverage > $1.voteAverage }
                }
                
                let localMediaUI = moviesDBToMediaUI(localMovies: sortedMovies)
                movieSubject.send(localMediaUI)
            } else {
                saveIntoDB = true
            }
            
            if networkMonitor.isConnected {
                do {
                    let remoteMovies = try await self.getMovies(for: category, page: page)
                    
                    if(saveIntoDB){
                        await self.moviesDB.saveMovies(movies: moviesDTOToMovieDB(remoteMovies: remoteMovies, category: category))
                    }
                    
                    let remoteMediaUI = moviesDTOToMediaUI(remoteMovies: remoteMovies)
                    movieSubject.send(remoteMediaUI)
                    movieSubject.send(completion: .finished)
                } catch {
                    movieSubject.send(completion: .failure(error))
                }
            } else {
                movieSubject.send(completion: .finished)
            }
        }
        
        return movieSubject.eraseToAnyPublisher()
    }
    
    private func getMovies(for category: MediaCategory, page: Int) async throws -> [MovieDto] {
        switch category {
        case .popular:
            return try await movieService.getPopularMovies(page: page)
        case .topRated:
            return try await movieService.getTopRatedMovies(page: page)
        }
    }
    
    func getListOfSeries(category: MediaCategory, page: Int)-> AnyPublisher<[MediaUI], Error> {
        let seriesSubject = PassthroughSubject<[MediaUI], Error>()
        
        Task {
            var saveIntoDB = false
            
            let localSeries = await seriesDB.getSeriesByCategory(category: category.rawValue)
            
            if(!localSeries.isEmpty && page == 1){
                var sortedSeries: [SeriesDB] = []
                
                switch category{
                case .popular:
                    sortedSeries = localSeries.sorted { $0.popularity > $1.popularity }
                case .topRated:
                    sortedSeries = localSeries.sorted { $0.voteAverage > $1.voteAverage }
                }
                
                let localMediaUI = seriesDBToMediaUI(localSeries: sortedSeries)
                seriesSubject.send(localMediaUI)
            } else {
                saveIntoDB = true
            }
            
            if networkMonitor.isConnected {
                do {
                    // Observe network to check if we call remote
                    let remoteSeries = try await getSeries(for: category, page: page)
                    if(saveIntoDB){
                        await seriesDB.saveSeries(series: seriesDTOToMovieDB(remoteSeries: remoteSeries, category: category))
                    }
                    let remoteMediaUI = SeriesDTOToMediaUI(remoteSeries: remoteSeries)
                    seriesSubject.send(remoteMediaUI)
                    seriesSubject.send(completion: .finished)
                } catch {
                    seriesSubject.send(completion: .failure(error))
                }
            } else {
                seriesSubject.send(completion: .finished)
            }
        }
        
        return seriesSubject.eraseToAnyPublisher()
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
