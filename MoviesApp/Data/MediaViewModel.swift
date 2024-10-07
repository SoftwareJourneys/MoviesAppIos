//
//  MediaViewModel.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

class MediaViewModel: ObservableObject {
    
    let mediaRepository: MediaRepository
    
    @Published var popularMovies : [MovieUI] = []
    @Published var topRatedMovies : [MovieUI] = []
    @Published var popularSeries : [MovieUI] = []
    @Published var topRatedSeries : [MovieUI] = []
    
    @Published var errorMessage: String?
    
    init(mediaRepository: MediaRepository) {
        self.mediaRepository = mediaRepository
    }
    
    func getMedia() {
        fetchPopularMovies()
        fetchTopRatedMovies()
        fetchPopularSeries()
        fetchTopRatedSeries()
    }
        
    private func fetchPopularMovies() {
        Task {
            do {
                let movies = try await mediaRepository.getListOfMovies(category: .popular)
                DispatchQueue.main.async {
                    self.popularMovies = moviesDTOToMovieUI(remoteMovies: movies)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching popular movies: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func fetchTopRatedMovies() {
        Task {
            do {
                let movies = try await mediaRepository.getListOfMovies(category: .topRated)
                DispatchQueue.main.async {
                    self.topRatedMovies = moviesDTOToMovieUI(remoteMovies: movies)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching top-rated movies: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func fetchPopularSeries() {
        Task {
            do {
                let series = try await mediaRepository.getListOfSeries(category: .popular)
                DispatchQueue.main.async {
                    self.popularSeries = SeriesDTOToMovieUI(remoteMovies: series)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching popular movies: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func fetchTopRatedSeries() {
        Task {
            do {
                let series = try await mediaRepository.getListOfSeries(category: .topRated)
                DispatchQueue.main.async {
                    self.topRatedSeries = SeriesDTOToMovieUI(remoteMovies: series)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching top-rated movies: \(error.localizedDescription)"
                }
            }
        }
    }
    
    
    
}
