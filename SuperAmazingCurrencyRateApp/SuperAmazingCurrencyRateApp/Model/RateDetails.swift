//
//  RateDetails.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

public struct RateDetails: Codable, Equatable {
    let tableType: String?
    let currency: String
    let currencyCode: String
    let rates: [Rate]
    
    enum CodingKeys: String, CodingKey {
        case tableType = "table"
        case currency
        case currencyCode = "code"
        case rates
    }
    
    public init(tableType: String?, currency: String, currencyCode: String, rates: [Rate]) {
        self.tableType = tableType
        self.currency = currency
        self.currencyCode = currencyCode
        self.rates = rates
    }
}
