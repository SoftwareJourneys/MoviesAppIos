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
        mediaRepository.getListOfMovies(category: .popular, page: self.pagePopularMovies)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.handleCompletion(
                    completion: completion,
                    errorMessage: "Error fetching popular movies",
                    onFinished: {self.pagePopularMovies+=1}
                )
            }, receiveValue: { movies in
                if(self.pagePopularMovies == 1){
                    self.popularMovies = movies
                } else {
                    self.popularMovies.append(contentsOf: movies)
                }
            })
            .store(in: &cancellables)
    }
    
    func fetchTopRatedMovies() {
        mediaRepository.getListOfMovies(
            category: .topRated,
            page: self.pageTopRatedMovies
        )
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { completion in
            self.handleCompletion(
                completion: completion,
                errorMessage: "Error fetching top-rated movies",
                onFinished: {self.pageTopRatedMovies+=1}
            )
        }, receiveValue: { movies in
            if(self.pageTopRatedMovies == 1){
                self.topRatedMovies = movies
            } else {
                self.topRatedMovies.append(contentsOf: movies)
            }
        })
        .store(in: &cancellables)
    }
    
    func fetchPopularSeries() {
        mediaRepository.getListOfSeries(
            category: .popular,
            page: self.pagePopularSeries
        )
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { completion in
            self.handleCompletion(
                completion: completion,
                errorMessage: "Error fetching popular series",
                onFinished: {
                    self.pagePopularSeries+=1
                }
            )
        }, receiveValue: { series in
            
            if(self.pagePopularSeries == 1){
                self.popularSeries = series
            } else {
                self.popularSeries.append(contentsOf: series)
            }
        })
        .store(in: &cancellables)
    }
    
    func fetchTopRatedSeries() {
        mediaRepository.getListOfSeries(category: .topRated, page: self.pageTopRatedSeries)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.handleCompletion(
                    completion: completion,
                    errorMessage: "Error fetching top-rated series",
                    onFinished: {
                        self.pageTopRatedSeries+=1
                    }
                )
            }, receiveValue: { series in
                if(self.pageTopRatedSeries == 1){
                    self.topRatedSeries = series
                } else {
                    self.topRatedSeries.append(contentsOf: series)
                }
            })
            .store(in: &cancellables)
    }
    
    private func setupNetworkMonitoring() {
        networkMonitor.$isConnected
            .receive(on: DispatchQueue.main)
            .assign(to: &$isConnected)
    }
    
    private func handleCompletion(
        completion: Subscribers.Completion<Error>,
        errorMessage: String,
        onFinished: () -> Void
    ) {
        switch completion {
        case .finished:
            print("Request completed successfully.")
            onFinished()
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
