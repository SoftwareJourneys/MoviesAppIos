//
//  SeriesServiceProtocol.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation

protocol SeriesServiceProtocol {
    func getPopularSeries(completion: @escaping (Result<[SeriesDto], Error>) -> Void)
    func getTopRatedSeries(seriesId: Int, completion: @escaping (Result<[SeriesDto], Error>) -> Void)
}
