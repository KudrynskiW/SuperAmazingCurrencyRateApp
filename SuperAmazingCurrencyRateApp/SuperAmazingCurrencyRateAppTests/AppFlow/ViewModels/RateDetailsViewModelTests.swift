//
//  RateDetailsViewModelTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 04/08/2025.
//

import Foundation
import Testing

@testable import SuperAmazingCurrencyRateApp

struct RateDetailsViewModelTests {
    let repositoryMock: NBPRatesRepositoryMock
    
    init() {
        repositoryMock = NBPRatesRepositoryMock()
    }
    
    @Test
    func loadProperData_rateDetails_emptySourceRateTableType() async {
        let sourceRate: Rate = .init(currencyCode: "PLN", averageCourse: 1.0)
        
        let sut = RateDetailsViewModel(rate: sourceRate, rateManager: RateManager(repository: repositoryMock))
        await sut.onAppear()
        
        #expect(await sut.rateDetails == nil)
        #expect(await sut.navigationTitle == "")
    }
    
    @Test
    func loadProperData_rateDetails_emptySourceRateCurrencyCode() async {
        let sourceRate: Rate = .init(tableType: .a, averageCourse: 1.0)
        
        let sut = RateDetailsViewModel(rate: sourceRate, rateManager: RateManager(repository: repositoryMock))
        await sut.onAppear()
        
        #expect(await sut.rateDetails == nil)
        #expect(await sut.navigationTitle == "")
    }
    
    @Test
    func loadProperData_rateDetails_properDataLoaded() async {
        let sourceRate: Rate = .init(tableType: .a, currency: "Polish Zloty", currencyCode: "PLN", averageCourse: 1.0)
        let rateDetailsRates: [Rate] = [.init(tableNumber: "testNum",
                                              publicationDate: Date().toNBPString(),
                                              averageCourse: 12.0),
                                        .init(tableNumber: "testNum2",
                                              publicationDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)?.toNBPString(),
                                              averageCourse: 10.0)]
        let rateDetails: RateDetails = .init(tableType: .a,
                                             currency: "Polish Zloty",
                                             currencyCode: "PLN",
                                             rates: rateDetailsRates)
        
        repositoryMock.getRateDetailsReturnValue = rateDetails
        
        let sut = RateDetailsViewModel(rate: sourceRate, rateManager: RateManager(repository: repositoryMock))
        await sut.onAppear()
        
        let properNavigationTitle = (sourceRate.currency?.capitalized ?? "") + "(" + (sourceRate.currencyCode?.uppercased() ?? "") + ")"
        
        #expect(await sut.navigationTitle == properNavigationTitle)
        #expect(await sut.rateDetails == rateDetails)
        #expect(await sut.isMoreThanTenPercentFromLatest(rate: rateDetails.rates[0]))
        #expect(await sut.isMoreThanTenPercentFromLatest(rate: rateDetails.rates[1]))
    }
}
