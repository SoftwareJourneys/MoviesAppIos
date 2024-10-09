//
//  SeriesDatabaseProtocol.swift
//  MoviesApp
//
//  Created by Work on 10/8/24.
//

import Foundation

protocol SeriesDatabaseProtocol {
    
    @MainActor
    func saveSeries(series: [SeriesDB])
    
    @MainActor
    func getSeriesByCategory(category : String) -> [SeriesDB]
}
