//
//  SeriesServiceProtocol.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation


protocol SeriesServiceProtocol {

    func getPopularSeries(page: Int) async throws -> [SeriesDto]
    func getTopRatedSeries(page: Int) async throws -> [SeriesDto]

}
