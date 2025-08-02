//
//  GetTableRequest.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

struct GetTableRequest: NBPRatesRepositoryRequest {
    var baseURL = "https://api.nbp.pl/api/exchangerates/"
    var path = "tables"
    var httpMethod: HTTPMethod = .get
}
