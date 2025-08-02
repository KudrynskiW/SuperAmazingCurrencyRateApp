//
//  NBPRatesRepositoryMock.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

@testable import SuperAmazingCurrencyRateApp

final class NBPRatesRepositoryMock: NBPRatesRepositoryProtocol {
    var getTableReturnValue: RatesList?
    var getTableReturnCalled: Bool = false
    var getTableReturnCallsCount: Int = 0
    var getTableReturnFallbackValue = RatesList(tableType: .a, tableNumber: "", publicationDate: "", rates: [])
    func getTable(table: RateDetails.TableType) async throws -> RatesList {
        getTableReturnCalled = true
        getTableReturnCallsCount += 1
        
        return getTableReturnValue ?? getTableReturnFallbackValue
    }
    
    var getRateDetailsReturnValue: RateDetails?
    var getRateDetailsCalled: Bool = false
    var getRateDetailsCallsCount: Int = 0
    var getRateDetailsFallbackValue = RateDetails(tableType: .a, currency: "", currencyCode: "", rates: [])
    func getRateDetails(table: RateDetails.TableType, currencyCode: String, dateFrom: Date, dateTo: Date) async throws -> RateDetails {
        getRateDetailsCalled = true
        getRateDetailsCallsCount += 1
        
        return getRateDetailsReturnValue ?? getRateDetailsFallbackValue
    }
    
    
}
