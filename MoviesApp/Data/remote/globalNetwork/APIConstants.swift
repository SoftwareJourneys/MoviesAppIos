//
//  APIConstants.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation
import Alamofire

struct APIConstants {
    static let baseURL = "https://api.themoviedb.org/3"

    static let headers: HTTPHeaders = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZDc3OTM3Nzc2MTg1MmMxMWZhNzJhNjdkOTM3ZjE4ZSIsIm5iZiI6MTcyNDk2MzYxOC44NDgzNjMsInN1YiI6IjY2ZDBkYTFlOGUzNzgwZTEwNzZkZTJjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9-v4_kcF9vIDuiSJTYfmTjNm8qDuRr6MqEiq-7mvqBg"
    ]
}
