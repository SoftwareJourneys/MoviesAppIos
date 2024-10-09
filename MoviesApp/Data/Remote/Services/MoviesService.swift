//
//  MoviesService.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation
import Alamofire

class MoviesService: MoviesServiceProtocol {

    private let baseURL = APIConstants.baseURL + "/movie"
    
    static let shared = MoviesService()


    func getPopularMovies(page: Int)async throws -> [MovieDto] {
        let url = "\(baseURL)/popular?page=\(page)"

        let response = try await AF.request(url, method: .get, headers: APIConstants.headers).serializingDecodable(ResponseDto<MovieDto>.self).value
                return response.results
    }


    func getTopRatedMovies(page: Int)async throws -> [MovieDto] {
        let url = "\(baseURL)/top_rated?page=\(page)"

        let response = try await AF.request(url, method: .get, headers: APIConstants.headers).serializingDecodable(ResponseDto<MovieDto>.self).value
                return response.results
    }
}
