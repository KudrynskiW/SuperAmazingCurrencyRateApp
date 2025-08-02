//
//  RatessList.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

public struct RatesList: Codable, Equatable {
    let tableType: String
    let tableNumber: String
    let publicationDate: String
    let rates: [Rate]
    
    enum CodingKeys: String, CodingKey {
        case tableType = "table"
        case tableNumber = "no"
        case publicationDate = "effectiveDate"
        case rates
    }
    
    public init(tableType: String, tableNumber: String, publicationDate: String, rates: [Rate]) {
        self.tableType = tableType
        self.tableNumber = tableNumber
        self.publicationDate = publicationDate
        self.rates = rates
    }
}
