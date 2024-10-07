//
//  SeriesServiceProtocol.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation


protocol SeriesServiceProtocol {

    func getPopularSeries() async throws -> [SeriesDto]
    func getTopRatedSeries() async throws -> [SeriesDto]

}
