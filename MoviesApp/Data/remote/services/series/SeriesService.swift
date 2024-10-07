//
//  SeriesService.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation
import Alamofire


class SeriesService: SeriesServiceProtocol {

    static let shared = SeriesService()

    private let baseURL = APIConstants.baseURL + "/tv"


    func getPopularSeries() async throws -> [SeriesDto] {
        let url = "\(baseURL)/popular"

        let response = try await AF.request(url, method: .get, headers: APIConstants.headers).serializingDecodable(ResponseDto<SeriesDto>.self).value
                return response.results
    }


    func getTopRatedSeries() async throws -> [SeriesDto] {
        let url = "\(baseURL)/top_rated"

        let response = try await AF.request(url, method: .get, headers: APIConstants.headers).serializingDecodable(ResponseDto<SeriesDto>.self).value
                return response.results
    }
}
