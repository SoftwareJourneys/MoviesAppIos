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


    func getPopularMovies(completion: @escaping (Result<[MovieDto], Error>) -> Void) {
        let url = "\(baseURL)/popular"

        AF.request(url, method: .get, headers: APIConstants.headers).responseDecodable(of: ResponseDto<MovieDto>.self) { response in
            switch response.result {
            case .success(let postMoviesDTO):
                completion(.success(postMoviesDTO.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    func getTopRatedMovies(completion: @escaping (Result<[MovieDto], Error>) -> Void) {
        let url = "\(baseURL)/top_rated"

        AF.request(url, method: .get, headers: APIConstants.headers).responseDecodable(of: ResponseDto<MovieDto>.self) { response in
            switch response.result {
            case .success(let postMoviesDTO):
                completion(.success(postMoviesDTO.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
