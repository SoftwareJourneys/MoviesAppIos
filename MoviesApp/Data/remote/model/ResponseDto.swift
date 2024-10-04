//
//  ResponseDto.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation

struct ResponseDto<T: Decodable>: Decodable {
    let page: Int
    let results: [T]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
