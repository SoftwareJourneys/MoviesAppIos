//
//  MoviesServiceProtocol.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation

protocol MoviesServiceProtocol {
    func getPopularMovies(completion: @escaping (Result<[MovieDto], Error>) -> Void)
    func getTopRatedMovies(completion: @escaping (Result<[MovieDto], Error>) -> Void)
}
