//
//  RatessList.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

public struct RatesList: Codable, Equatable {
    public let tableType: RateDetails.TableType
    public let tableNumber: String
    public let publicationDate: String
    public let rates: [Rate]
    
    enum CodingKeys: String, CodingKey {
        case tableType = "table"
        case tableNumber = "no"
        case publicationDate = "effectiveDate"
        case rates
    }
    
    public init(tableType: RateDetails.TableType, tableNumber: String, publicationDate: String, rates: [Rate]) {
        self.tableType = tableType
        self.tableNumber = tableNumber
        self.publicationDate = publicationDate
        self.rates = rates
    }
}
