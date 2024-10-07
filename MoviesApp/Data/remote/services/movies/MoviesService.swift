//
//  MoviesService.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation
import Alamofire

class MoviesService: MoviesServiceProtocol {

    static let shared = MoviesService()

    private let baseURL = APIConstants.baseURL + "/movie"


    func getPopularMovies()async throws -> [MovieDto] {
        let url = "\(baseURL)/popular"

        let response = try await AF.request(url, method: .get, headers: APIConstants.headers).serializingDecodable(ResponseDto<MovieDto>.self).value
                return response.results
    }


    func getTopRatedMovies()async throws -> [MovieDto] {
        let url = "\(baseURL)/top_rated"

        let response = try await AF.request(url, method: .get, headers: APIConstants.headers).serializingDecodable(ResponseDto<MovieDto>.self).value
                return response.results
    }
}
