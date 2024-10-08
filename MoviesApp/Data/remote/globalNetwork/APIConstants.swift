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
        APIStrings.accept.rawValue: APIStrings.acceptValue.rawValue,
        APIStrings.authorization.rawValue : apiKey
    ]
    
    
    private static var apiKey: String {
        return getValue(for: .apiKey)
    }
    
    public static var baseURL: String {
        return getValue(for: .apiUrl)
    }
    
    private static func getValue(for key: APIStrings) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String ?? ""
    }
}

enum APIStrings : String, Codable{
    case apiKey = "API_KEY"
    case apiUrl = "API_URL"
    case accept = "accept"
    case acceptValue = "application/json"
    case authorization  = "Authorization"
}
