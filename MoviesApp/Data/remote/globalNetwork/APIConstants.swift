//
//  APIConstants.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import Foundation
import Alamofire

struct APIConstants {
    static let headers: HTTPHeaders = [
        "accept": "application/json",
        "Authorization": "\(apiKey)"
    ]
    
    
    private static var apiKey: String {
        return Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    }
    
    public static var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "API_URL") as? String ?? ""
    }
}
