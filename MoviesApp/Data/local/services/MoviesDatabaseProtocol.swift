//
//  MoviesDatabaseProtocol.swift
//  MoviesApp
//
//  Created by Work on 10/8/24.
//

import Foundation

protocol MoviesDatabaseProtocol {
    
    @MainActor
    func saveMovies(movies: [MovieDB])
    
    @MainActor
    func getMoviesByCategory(category : String) -> [MovieDB]
}
