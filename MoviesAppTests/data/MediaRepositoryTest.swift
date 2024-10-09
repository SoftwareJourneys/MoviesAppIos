//
//  MediaRepositoryTest.swift
//  MoviesAppTests
//
//  Created by Work on 10/8/24.
//

import Foundation
import XCTest
import Combine

@testable import MoviesApp

class MediaRepositoryTest: XCTestCase {
    
    var cancellables: Set<AnyCancellable>!
    var repository: MediaRepository!
    var movieService: MockMovieService!
    var seriesService: MockSeriesService!
    var moviesDB: MockMoviesDatabaseManager!
    var seriesDB: MockSeriesDatabaseManager!
    var networkMonitor: MockNetworkMonitorService!
    
    override func setUp() {
        super.setUp()
        movieService = MockMovieService()
        seriesService = MockSeriesService()
        moviesDB = MockMoviesDatabaseManager()
        seriesDB = MockSeriesDatabaseManager()
        networkMonitor = MockNetworkMonitorService(isConnected: true)
        
        repository = MediaRepository(
            movieService: movieService,
            seriesService: seriesService,
            seriesDB: seriesDB,
            moviesDB: moviesDB
        )
        
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        cancellables = nil
        repository = nil
        movieService = nil
        seriesService = nil
        moviesDB = nil
        seriesDB = nil
        networkMonitor = nil
        
        super.tearDown()
    }
    
    func testGetListOfPopularMovies_success_network() async throws {
        
        // Given
        let movieDto = MovieDto(
            adult: false,
            backdropPath: nil,
            genreIds: [],
            id: 1,
            originCountry: nil,
            originalLanguage: "en",
            originalName: "Local Movie",
            overview: "Overview",
            popularity: 10.0,
            posterPath: "",
            firstAirDate: "2024-10-08",
            name: "Local Movie",
            voteAverage: 8.0,
            voteCount: 1000
        )
        
        movieService.popularMoviesResult = .success([movieDto])
        
        let expectation = XCTestExpectation(description: "Fetch local movies")
        
        // When
        let movies = await repository.getListOfMovies(category: .popular, page: 1)
        
        XCTAssertEqual(movies.count, 1)
        XCTAssertEqual(movies.first?.title, "Local Movie")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    func testGetListOfPopularMovies_failed_network_send_db() async throws {
        
        // Given
        let localMovie = MovieDB(id: 1, adult: false, backdropPath: nil, genreIds: [], originalLanguage: "en", originalTitle: "Local Movie", overview: "Overview", popularity: 10.0, posterPath: nil, releaseDate: "2024-10-08", title: "Local DB Movie", voteAverage: 8.0, voteCount: 1000, category: "popular")
        
        moviesDB.movies = [localMovie]
        
        
        movieService.popularMoviesResult = .failure(URLError(.notConnectedToInternet))
        
        let expectation = XCTestExpectation(description: "Fetch local movies")
        
        // When
        let movies = await repository.getListOfMovies(category: .popular, page: 1)
        
        XCTAssertEqual(movies.count, 1)
        XCTAssertEqual(movies.first?.title, "Local DB Movie")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    func testGetListOfTopRatedMovies_success_network() async throws {
        
        // Given
        
        let movieDto = MovieDto(
            adult: false,
            backdropPath: nil,
            genreIds: [],
            id: 1,
            originCountry: nil,
            originalLanguage: "en",
            originalName: "Local Movie",
            overview: "Overview",
            popularity: 10.0,
            posterPath: "",
            firstAirDate: "2024-10-08",
            name: "Local Movie",
            voteAverage: 8.0,
            voteCount: 1000
        )
        
        movieService.topRatedMoviesResult = .success([movieDto])
        
        let expectation = XCTestExpectation(description: "Fetch local movies")
        
        // When
        let movies = await repository.getListOfMovies(category: .topRated, page: 1)
        
        XCTAssertEqual(movies.count, 1)
        XCTAssertEqual(movies.first?.title, "Local Movie")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    func testGetListOfTopRatedMovies_failed_network_send_db() async throws {
        
        // Given
        let localMovie = MovieDB(id: 1, adult: false, backdropPath: nil, genreIds: [], originalLanguage: "en", originalTitle: "Local Movie", overview: "Overview", popularity: 10.0, posterPath: nil, releaseDate: "2024-10-08", title: "Local Movie", voteAverage: 8.0, voteCount: 1000, category: "popular")
        moviesDB.movies = [localMovie]
        
        movieService.topRatedMoviesResult = .failure(URLError(.notConnectedToInternet))
        
        let expectation = XCTestExpectation(description: "Fetch local movies")
        
        // When
        let movies = await repository.getListOfMovies(category: .topRated, page: 1)
        
        XCTAssertEqual(movies.count, 1)
        XCTAssertEqual(movies.first?.title, "Local Movie")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    func testGetListOfPopularSeries_success_network() async throws {
        
        // Given
        let seriesDto = SeriesDto(backdropPath: "/path/to/backdrop.jpg", firstAirDate: "2024-10-08", genreIds: [1, 2], id: 1, name: "Local Series", originCountry: ["US"], originalLanguage: "en", originalName: "Local Series", overview: "Overview", popularity: 10.0, posterPath: "/path/to/poster.jpg", voteAverage: 8.0, voteCount: 1000)
        
        seriesService.popularSeriesResult = .success([seriesDto])
        
        let expectation = XCTestExpectation(description: "Fetch local movies")
        
        // When
        let series = await repository.getListOfSeries(category: .popular, page: 1)
        
        XCTAssertEqual(series.count, 1)
        XCTAssertEqual(series.first?.title, "Local Series")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    func testGetListOfPopularSeries_failed_network_send_db() async throws {
        
        // Given
        let localSerie = SeriesDB(id: 1, backdropPath: "/path/to/backdrop.jpg", firstAirDate: "2024-10-08", genreIds: [1, 2], name: "Local Series", originCountry: ["US"], originalLanguage: "en", originalName: "Local Series", overview: "Overview", popularity: 10.0, posterPath: "/path/to/poster.jpg", voteAverage: 8.0, voteCount: 1000, category: "popular")
        
        seriesDB.series = [localSerie]
        
        seriesService.popularSeriesResult = .failure(URLError(.notConnectedToInternet))
        
        let expectation = XCTestExpectation(description: "Fetch local movies")
        
        // When
        let series = await repository.getListOfSeries(category: .popular, page: 1)
        
        XCTAssertEqual(series.count, 1)
        XCTAssertEqual(series.first?.title, "Local Series")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    func testGetListOfTopRatedSeries_success_network() async throws {
        
        // Given
        
        let seriesDto = SeriesDto(backdropPath: "/path/to/backdrop.jpg", firstAirDate: "2024-10-08", genreIds: [1, 2], id: 1, name: "Local Series", originCountry: ["US"], originalLanguage: "en", originalName: "Local Series", overview: "Overview", popularity: 10.0, posterPath: "/path/to/poster.jpg", voteAverage: 8.0, voteCount: 1000)
        
        seriesService.topRatedSeriesResult = .success([seriesDto])
        
        let expectation = XCTestExpectation(description: "Fetch local movies")
        
        // When
        let series = await repository.getListOfSeries(category: .topRated, page: 1)
        
        XCTAssertEqual(series.count, 1)
        XCTAssertEqual(series.first?.title, "Local Series")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    func testGetListOfTopRatedSeries_failed_network_send_db() async throws {
        
        // Given
        let localSerie = SeriesDB(id: 1, backdropPath: "/path/to/backdrop.jpg", firstAirDate: "2024-10-08", genreIds: [1, 2], name: "Local Series", originCountry: ["US"], originalLanguage: "en", originalName: "Local Series", overview: "Overview", popularity: 10.0, posterPath: "/path/to/poster.jpg", voteAverage: 8.0, voteCount: 1000, category: "popular")
        
        seriesDB.series = [localSerie]
        
        seriesService.topRatedSeriesResult = .failure(URLError(.notConnectedToInternet))
        
        let expectation = XCTestExpectation(description: "Fetch local movies")
        
        // When
        let series = await repository.getListOfSeries(category: .topRated, page: 1)
        
        XCTAssertEqual(series.count, 1)
        XCTAssertEqual(series.first?.title, "Local Series")
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 2)
    }
    
    
}
