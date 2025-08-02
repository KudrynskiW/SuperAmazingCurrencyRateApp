//
//  Rate.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

public struct Rate: Codable, Equatable {
    let tableNumber: String?
    let publicationDate: String?
    let currency: String?
    let currencyCode: String?
    let averageCourse: Decimal
    
    enum CodingKeys: String, CodingKey {
        case tableNumber = "no"
        case publicationDate = "effectiveDate"
        case currency
        case currencyCode = "code"
        case averageCourse = "mid"
    }
    
    public init(tableNumber: String? = nil,
                publicationDate: String? = nil,
                currency: String? = nil,
                currencyCode: String? = nil,
                averageCourse: Decimal) {
        self.tableNumber = tableNumber
        self.publicationDate = publicationDate
        self.currency = currency
        self.currencyCode = currencyCode
        self.averageCourse = averageCourse
    }
}
