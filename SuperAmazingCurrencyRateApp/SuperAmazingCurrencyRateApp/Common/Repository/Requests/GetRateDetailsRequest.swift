//
//  GetRateDetailsRequest.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

struct GetRateDetailsRequest: NBPRatesRepositoryRequest {
    var baseURL = "https://api.nbp.pl/api/exchangerates/"
    var path = "rates"
    var httpMethod: HTTPMethod = .get
}
