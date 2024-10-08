//
//  MoviesServiceProtocol.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation

protocol MoviesServiceProtocol {
    func getPopularMovies(page: Int)async throws -> [MovieDto]
    func getTopRatedMovies(page: Int)async throws -> [MovieDto]
}
