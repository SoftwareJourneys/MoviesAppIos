//
//  ResponseSeriesDto.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation

struct ResponseSeriesDto: Decodable {
    let page: Int
    let series: [SeriesDto]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case series = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

