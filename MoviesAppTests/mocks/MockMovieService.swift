//
//  MockMovieService.swift
//  MoviesAppTests
//
//  Created by Work on 10/8/24.
//

import Foundation
@testable import MoviesApp

class MockMovieService: MoviesServiceProtocol {
    var popularMoviesResult: Result<[MovieDto], Error> = .success([])
    var topRatedMoviesResult: Result<[MovieDto], Error> = .success([])

    func getPopularMovies(page: Int) async throws -> [MovieDto] {
        return try popularMoviesResult.get()
    }

    func getTopRatedMovies(page: Int) async throws -> [MovieDto] {
        return try topRatedMoviesResult.get()
    }
}
