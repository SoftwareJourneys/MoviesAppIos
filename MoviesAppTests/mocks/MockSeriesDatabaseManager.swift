//
//  MockSeriesDatabaseManager.swift
//  MoviesAppTests
//
//  Created by Work on 10/8/24.
//

import Foundation
@testable import MoviesApp

class MockSeriesDatabaseManager: SeriesDatabaseProtocol {
    
    var series: [SeriesDB] = []
    
    
    func saveSeries(series: [MoviesApp.SeriesDB]) {
    }

    
    func getSeriesByCategory(category: String) -> [MoviesApp.SeriesDB] {
        return self.series
    }
}
