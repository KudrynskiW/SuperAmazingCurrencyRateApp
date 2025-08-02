//
//  RateDetails.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

public struct RateDetails: Codable, Equatable {
    public enum TableType: String, Codable, Equatable, CaseIterable {
        case a = "A"
        case b = "B"
    }
    
    public let tableType: TableType?
    public let currency: String
    public let currencyCode: String
    public let rates: [Rate]
    
    enum CodingKeys: String, CodingKey {
        case tableType = "table"
        case currency
        case currencyCode = "code"
        case rates
    }
    
    public init(tableType: TableType, currency: String, currencyCode: String, rates: [Rate]) {
        self.tableType = tableType
        self.currency = currency
        self.currencyCode = currencyCode
        self.rates = rates
    }
    
    public func getSortedRates() -> [Rate] {
        rates.sorted(by: {
            if let firstDateString = $0.publicationDate,
               let secondDateString = $1.publicationDate,
               let firstDate = Date.fromNBPString(dateString: firstDateString),
               let secondDate = Date.fromNBPString(dateString: secondDateString) {
                return firstDate > secondDate
            }
            
            return false
        })
    }
}
