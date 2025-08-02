//
//  RateManagerProtocol.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

protocol RateManagerProtocol {
    @MainActor
    var ratesList: [RatesList] { get async throws }
    
    @MainActor
    func getRateDetails(table: RateDetails.TableType,
                        currencyCode: String,
                        dateFrom: Date,
                        dateTo: Date) async throws -> RateDetails
}
