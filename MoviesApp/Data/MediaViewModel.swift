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
                self.handleCompletion(completion: completion, errorMessage: "Error fetching popular movies")
            }, receiveValue: { movies in
                self.popularMovies = movies
            })
            .store(in: &cancellables)
    }
    
    private func fetchTopRatedMovies() {
        mediaRepository.getListOfMovies(category: .topRated)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.handleCompletion(completion: completion, errorMessage: "Error fetching top-rated movies")
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
                self.handleCompletion(completion: completion, errorMessage: "Error fetching top-rated series")
            }, receiveValue: { series in
                self.topRatedSeries = series
            })
            .store(in: &cancellables)
    }
    
    private func setupNetworkMonitoring() {
        networkMonitor.$isConnected
            .receive(on: DispatchQueue.main)
            .assign(to: &$isConnected)
    }
    
    private func handleCompletion(completion: Subscribers.Completion<Error>, errorMessage: String) {
        switch completion {
        case .finished:
            print("Request completed successfully.")
        case .failure(let error):
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet:
                    self.errorMessage = "No internet connection."
                case .timedOut:
                    self.errorMessage = "The request timed out."
                default:
                    self.errorMessage = "Network error."
                }
            } else if error is DecodingError {
                self.errorMessage = "Data decoding error."
            } else {
                self.errorMessage = "Failed to fetch movies."
            }
            logError(errorLocalization : errorMessage)
        }
    }
    
    func clearErrorMessage() {
        errorMessage = nil
    }
    
    private func logError(errorLocalization : String) {
        print("\(errorLocalization) \(self.errorMessage ?? "Unknown error")")
    }
    
    deinit {
        cancellables.removeAll()
    }
}
