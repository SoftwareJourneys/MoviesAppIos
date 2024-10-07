//
//  MoviesServiceProtocol.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation

protocol MoviesServiceProtocol {
    func getPopularMovies()async throws -> [MovieDto]
    func getTopRatedMovies()async throws -> [MovieDto]
}
