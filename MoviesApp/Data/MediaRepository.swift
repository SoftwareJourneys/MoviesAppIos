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
    
    func getListOfMovies(category: MediaCategory) -> AnyPublisher<[MediaUI], Error> {
        let movieSubject = PassthroughSubject<[MediaUI], Error>()
        
        Task {
            let localMovies = await moviesDB.getMoviesByCategory(category: category.rawValue)
            let localMediaUI = moviesDBToMediaUI(localMovies: localMovies)
            movieSubject.send(localMediaUI)
            
            if networkMonitor.isConnected {
                do {
                    let remoteMovies = try await self.getMovies(for: category)
                    await self.moviesDB.saveMovies(movies: moviesDTOToMovieDB(remoteMovies: remoteMovies, category: category))
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
    
    private func getMovies(for category: MediaCategory) async throws -> [MovieDto] {
        switch category {
        case .popular:
            return try await movieService.getPopularMovies()
        case .topRated:
            return try await movieService.getTopRatedMovies()
        }
    }
    
    func getListOfSeries(category: MediaCategory)-> AnyPublisher<[MediaUI], Error> {
        let seriesSubject = PassthroughSubject<[MediaUI], Error>()
        
        Task {
            let localSeries = await seriesDB.getSeriesByCategory(category: category.rawValue)
            let localMediaUI = seriesDBToMediaUI(localSeries: localSeries)
            seriesSubject.send(localMediaUI)
            
            if networkMonitor.isConnected {
                do {
                    // Observe network to check if we call remote
                    let remoteSeries = try await getSeries(for: category)
                    await seriesDB.saveSeries(series: seriesDTOToMovieDB(remoteSeries: remoteSeries, category: category))
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
    
    private func getSeries(for category: MediaCategory) async throws -> [SeriesDto] {
        switch category {
        case .popular:
            return try await seriesService.getPopularSeries()
        case .topRated:
            return try await seriesService.getTopRatedSeries()
        }
    }
    
    func getMovieById(id: Int) async throws -> MediaUI? {
        await movieDBToMediaUI(remoteMovie: moviesDB.getMovieById(id: Int64(id)))
    }
    
    func getSerieById(id: Int)async throws -> MediaUI? {
        await seriesDBToMediaUI(remoteSerie:seriesDB.getSerieById(id: Int64(id)))
        
    }
}
