//
//  NBPRatesRepositoryProtocol.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

protocol NBPRatesRepositoryProtocol {
    func getTable(table: RateDetails.TableType) async throws -> [RatesList]
    func getRateDetails(table: RateDetails.TableType, currencyCode: String, dateFrom: Date, dateTo: Date) async throws -> RateDetails
}
