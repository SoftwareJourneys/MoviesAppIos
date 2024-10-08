//
//  MockSeriesService.swift
//  MoviesAppTests
//
//  Created by Work on 10/8/24.
//

import Foundation
@testable import MoviesApp

class MockSeriesService: SeriesServiceProtocol {
    var popularSeriesResult: Result<[SeriesDto], Error> = .success([])
    var topRatedSeriesResult: Result<[SeriesDto], Error> = .success([])

    func getPopularSeries(page: Int) async throws -> [SeriesDto] {
        return try popularSeriesResult.get()
    }

    func getTopRatedSeries(page: Int) async throws -> [SeriesDto] {
        return try topRatedSeriesResult.get()
    }
}

