//
//  SeriesService.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation
import Alamofire


class SeriesService: SeriesServiceProtocol {

    private let baseURL = APIConstants.baseURL + "/tv"


    func getPopularSeries(page: Int) async throws -> [SeriesDto] {
        let url = "\(baseURL)/popular?page=\(page)"

        let response = try await AF.request(url, method: .get, headers: APIConstants.headers).serializingDecodable(ResponseDto<SeriesDto>.self).value
                return response.results
    }


    func getTopRatedSeries(page: Int) async throws -> [SeriesDto] {

        let url = "\(baseURL)/top_rated?page=\(page)"

        let response = try await AF.request(url, method: .get, headers: APIConstants.headers).serializingDecodable(ResponseDto<SeriesDto>.self).value
                return response.results
    }
}
