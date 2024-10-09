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
    
    private let mediaRepository: MediaRepository = MediaRepository.shared
    private let networkMonitor: NetworkMonitorService = NetworkMonitorService.shared
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isConnected: Bool = false
    @Published var popularMovies: [MediaUI] = []
    @Published var topRatedMovies: [MediaUI] = []
    @Published var popularSeries: [MediaUI] = []
    @Published var topRatedSeries: [MediaUI] = []
    
    @Published var errorMessage: String?
    
    var pageTopRatedMovies = 1
    var pagePopularMovies = 1
    var pageTopRatedSeries = 1
    var pagePopularSeries = 1
    
    init() {
        setupNetworkMonitoring()
    }
    
    func getMedia() {
        fetchPopularMovies()
        fetchTopRatedMovies()
        fetchPopularSeries()
        fetchTopRatedSeries()
    }
    
    func fetchPopularMovies() {
        Task {
            let movies = await mediaRepository.getListOfMovies(category: .popular, page: pagePopularMovies)
            
            DispatchQueue.main.async {
                self.handleMovies(movies, for: \.popularMovies, page: \.pagePopularMovies)
            }
        }
    }
    
    func fetchTopRatedMovies() {
        Task {
            let movies = await mediaRepository.getListOfMovies(category: .topRated, page: pageTopRatedMovies)
            
            DispatchQueue.main.async {
                self.handleMovies(movies, for: \.topRatedMovies, page: \.pageTopRatedMovies)
            }
        }
    }
    
    func fetchPopularSeries() {
        Task {
            let series = await mediaRepository.getListOfSeries(category: .popular, page: pagePopularSeries)
            DispatchQueue.main.async {
                self.handleSeries(series, for: \.popularSeries, page: \.pagePopularSeries)
            }
        }
    }
    
    func fetchTopRatedSeries() {
        Task {
            let series = await mediaRepository.getListOfSeries(category: .topRated, page: pageTopRatedSeries)
            DispatchQueue.main.async {
                self.handleSeries(series, for: \.topRatedSeries, page: \.pageTopRatedSeries)
            }
        }
    }
    
    private func handleMovies(_ movies: [MediaUI], for keyPath: ReferenceWritableKeyPath<MediaViewModel, [MediaUI]>, page: ReferenceWritableKeyPath<MediaViewModel, Int>) {
        if self[keyPath: page] == 1 {
            self[keyPath: keyPath] = movies
        } else {
            self[keyPath: keyPath].append(contentsOf: movies)
        }
        self[keyPath: page] += 1
    }
    
    private func handleSeries(_ series: [MediaUI], for keyPath: ReferenceWritableKeyPath<MediaViewModel, [MediaUI]>, page: ReferenceWritableKeyPath<MediaViewModel, Int>) {
        if self[keyPath: page] == 1 {
            self[keyPath: keyPath] = series
        } else {
            self[keyPath: keyPath].append(contentsOf: series)
        }
        self[keyPath: page] += 1
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
                self.errorMessage = "Failed to fetch data."
            }
            logError(errorLocalization: errorMessage)
        }
    }
    
    func clearErrorMessage() {
        errorMessage = nil
    }
    
    private func logError(errorLocalization: String) {
        print("\(errorLocalization) \(self.errorMessage ?? "Unknown error")")
    }
    
    private func findMediaById(in mediaList: [MediaUI], id: Int) -> MediaUI? {
        return mediaList.first { $0.id == id }
    }
    
    func getMovieById(id: Int) async throws -> MediaUI {
        if let movieFound = findMediaById(in: popularMovies + topRatedMovies, id: id) {
            return movieFound
        }
        return MediaUI(image: "", title: "", rating: "", date: "")
    }
    
    func getSerieById(id: Int) async throws -> MediaUI {
        if let serieFound = findMediaById(in: popularSeries + topRatedSeries, id: id) {
            return serieFound
        }
        return MediaUI(image: "", title: "", rating: "", date: "")
    }
    
    func isSerie(movie:MediaUI) -> Bool{
        return !(!popularSeries.contains(movie) && !topRatedSeries.contains(movie))
    }
    
    deinit {
        cancellables.removeAll()
    }
}
