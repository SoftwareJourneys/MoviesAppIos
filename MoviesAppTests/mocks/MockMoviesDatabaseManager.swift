//
//  MockMoviesDatabaseManager.swift
//  MoviesAppTests
//
//  Created by Work on 10/8/24.
//

import Foundation
@testable import MoviesApp

class MockMoviesDatabaseManager: MoviesDatabaseProtocol {    
    var movies: [MovieDB] = []
    
    
    func getMoviesByCategory(category: String) -> [MoviesApp.MovieDB] {
        return self.movies
    }
    
    
    func saveMovies(movies: [MoviesApp.MovieDB]) {
        self.movies.append(contentsOf: movies)
    }
}
