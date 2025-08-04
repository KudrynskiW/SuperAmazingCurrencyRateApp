//
//  RateListViewModelTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 04/08/2025.
//

import Foundation
import Testing

@testable import SuperAmazingCurrencyRateApp

struct RateListViewModelTests {
    let repositoryMock: NBPRatesRepositoryMock
    let sut: any RatesListViewModelProtocol
    
    init() {
        repositoryMock = NBPRatesRepositoryMock()
        let rateManager = RateManager(repository: repositoryMock)
        sut = RatesListViewModel(rateManager: rateManager)
    }
    
    @Test
    @MainActor
    func loadProperData_emptyRates() async {
        await sut.onAppear()
        #expect(sut.rates == [])
    }
    
    @Test
    @MainActor
    func loadProperData_someRates() async {
        let testRates: [Rate] = [.init(tableType: .a,
                                       currency: "bat (Tajlandia)",
                                       currencyCode: "THB",
                                       averageCourse: 0.114333),
                                 .init(tableType: .a,
                                       currency: "dolar amerykański",
                                       currencyCode: "USD",
                                       averageCourse: 3.753655)]
        
        repositoryMock.getTableReturnValue = [.init(tableType: .a,
                                                    tableNumber: "1",
                                                    publicationDate: Date().toNBPString(),
                                                    rates: testRates)]
        
        var returnedRates = testRates
        returnedRates.append(contentsOf: testRates)
        
        await sut.onAppear()
        
        #expect(sut.rates == returnedRates)
    }
}
