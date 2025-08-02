//
//  NBPRatesRepositoryRequest.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol NBPRatesRepositoryRequest {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
}
