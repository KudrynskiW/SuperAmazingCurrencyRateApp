//
//  RateManagerTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation
import Testing

@testable import SuperAmazingCurrencyRateApp

actor RateManagerTests {
    let repositoryMock: NBPRatesRepositoryMock
    var sut: RateManagerProtocol
    
    let testRatesForList: [Rate] = [.init(currency: "bat (Tajlandia)", currencyCode: "THB",averageCourse: 0.1143),
                             .init(currency: "dolar amerykański", currencyCode: "USD",averageCourse: 3.7536)]
    
    let testRatesForDetails: [Rate] = [.init(tableNumber: "135/A/NBP/2025", publicationDate: "2025-07-15", averageCourse: 4.8942),
                                       .init(tableNumber: "135/A/NBP/2025", publicationDate: "2025-07-14", averageCourse: 2.8942)]
    
    init() {
        repositoryMock = NBPRatesRepositoryMock()
        repositoryMock.getTableReturnValue = [.init(tableType: .a, tableNumber: "12345", publicationDate: "2025-08-01", rates: testRatesForList)]
        repositoryMock.getRateDetailsReturnValue = .init(tableType: .a, currency: "bat (Tajlandia)", currencyCode: "THB", rates: testRatesForDetails)
        
        sut = RateManager(repository: repositoryMock)
    }
    
    @Test
    func returnsCorrectList() async throws {
        let result = try await sut.ratesList
        
        #expect(result.first == result.last)
        #expect(result.first?.tableType == .a)
        #expect(result.first?.tableNumber == "12345")
        #expect(result.first?.publicationDate == "2025-08-01")
        #expect(result.first?.rates == testRatesForList)
        
        #expect(repositoryMock.getTableReturnCalled)
        #expect(repositoryMock.getTableReturnCallsCount == 2)
    }
    
    @Test
    func returnsCorrectDetails() async throws {
        let result = try await sut.getRateDetails(table: .a, currencyCode: "THB", dateFrom: Date(), dateTo: Date())
        
        #expect(result.tableType == .a)
        #expect(result.currency == "bat (Tajlandia)")
        #expect(result.currencyCode == "THB")
        #expect(result.rates == testRatesForDetails)
        
        #expect(repositoryMock.getRateDetailsCalled)
        #expect(repositoryMock.getRateDetailsCallsCount == 1)
    }
}
