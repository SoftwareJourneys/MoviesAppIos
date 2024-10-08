//
//  MediaViewModel.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import Network
import Combine
import Factory

class MediaViewModel: ObservableObject {
    
    @Injected(\.mediaRepository) private var mediaRepository: MediaRepository
    @Injected(\.networkMonitoring) private var networkMonitor: NetworkMonitorService
    

    private var cancellables = Set<AnyCancellable>()
    
    @Published var isConnected: Bool = false
    @Published var popularMovies : [MediaUI] = []
    @Published var topRatedMovies : [MediaUI] = []
    @Published var popularSeries : [MediaUI] = []
    @Published var topRatedSeries : [MediaUI] = []
    
    @Published var errorMessage: String?
    
    init() {
        setupNetworkMonitoring()
    }
    
    func getMedia() {
        fetchPopularMovies()
        fetchTopRatedMovies()
        fetchPopularSeries()
        fetchTopRatedSeries()
    }
    
    private func fetchPopularMovies() {
        mediaRepository.getListOfMovies(category: .popular)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = "Error fetching popular movies: \(error.localizedDescription)"
                }
            }, receiveValue: { movies in
                self.popularMovies = movies
            })
            .store(in: &cancellables)
    }
    
    private func fetchTopRatedMovies() {
        mediaRepository.getListOfMovies(category: .topRated)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = "Error fetching top-rated movies: \(error.localizedDescription)"
                }
            }, receiveValue: { movies in
                self.topRatedMovies = movies
            })
            .store(in: &cancellables)
    }
    
    private func fetchPopularSeries() {
        mediaRepository.getListOfSeries(category: .popular)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = "Error fetching top-rated movies: \(error.localizedDescription)"
                }
            }, receiveValue: { movies in
                self.popularSeries = movies
            })
            .store(in: &cancellables)
    }
    
    private func fetchTopRatedSeries() {
        mediaRepository.getListOfSeries(category: .topRated)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = "Error fetching top-rated movies: \(error.localizedDescription)"
                }
            }, receiveValue: { movies in
                self.topRatedSeries = movies
            })
            .store(in: &cancellables)
    }
    
    
    private func setupNetworkMonitoring() {
           networkMonitor.$isConnected
               .receive(on: DispatchQueue.main)
               .assign(to: &$isConnected)
       }
    
    deinit {
        cancellables.removeAll()
    }
}
