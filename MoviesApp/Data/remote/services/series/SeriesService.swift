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


    func getPopularSeries(completion: @escaping (Result<[SeriesDto], Error>) -> Void) {
        let url = "\(baseURL)/popular"

        AF.request(url, method: .get, headers: APIConstants.headers).responseDecodable(of: ResponseDto<SeriesDto>.self) { response in
            switch response.result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    func getTopRatedSeries(completion: @escaping (Result<[SeriesDto], Error>) -> Void) {
        let url = "\(baseURL)/top_rated"

        AF.request(url, method: .get, headers: APIConstants.headers).responseDecodable(of: ResponseDto<SeriesDto>.self) { response in
            switch response.result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
