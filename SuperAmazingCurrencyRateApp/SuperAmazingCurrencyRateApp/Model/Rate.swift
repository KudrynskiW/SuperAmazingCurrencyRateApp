//
//  Rate.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

public struct Rate: Codable, Equatable, Hashable, Identifiable {
    public let id: UUID = UUID()
    public let tableType: RateDetails.TableType?
    public let tableNumber: String?
    public let publicationDate: String?
    public let currency: String?
    public let currencyCode: String?
    public let averageCourse: Decimal
    
    enum CodingKeys: String, CodingKey {
        case tableType = "table"
        case tableNumber = "no"
        case publicationDate = "effectiveDate"
        case currency
        case currencyCode = "code"
        case averageCourse = "mid"
    }
    
    public init(tableType: RateDetails.TableType? = nil,
                tableNumber: String? = nil,
                publicationDate: String? = nil,
                currency: String? = nil,
                currencyCode: String? = nil,
                averageCourse: Decimal) {
        self.tableType = tableType
        self.tableNumber = tableNumber
        self.publicationDate = publicationDate
        self.currency = currency
        self.currencyCode = currencyCode
        self.averageCourse = averageCourse
    }
    
    static public func == (lhs: Self, rhs: Self) -> Bool {
        lhs.tableType == rhs.tableType &&
        lhs.tableNumber == rhs.tableNumber &&
        lhs.publicationDate == rhs.publicationDate &&
        lhs.currency == rhs.currency &&
        lhs.currencyCode == rhs.currencyCode &&
        lhs.averageCourse == rhs.averageCourse
    }
}
