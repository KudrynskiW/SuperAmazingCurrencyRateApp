//
//  Date+NBPTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation
import Testing

@testable import SuperAmazingCurrencyRateApp

struct DateNBPTests {
    let locale = Locale(identifier: "pl_PL")
    
    @Test(arguments: [
        "2025-08-01",
        "2024-08-15",
        "2000-01-01"
    ])
    func dateFromString(dateString: String) {
        let result = Date.fromNBPString(dateString: dateString, locale: locale)
        
        #expect([Date(timeIntervalSince1970: 1753999200),
                 Date(timeIntervalSince1970: 1723672800),
                 Date(timeIntervalSince1970: 946681200)].contains(result))
    }
    
    @Test(arguments: [
        Date(timeIntervalSince1970: 949359600),
        Date(timeIntervalSince1970: 1718834400),
        Date(timeIntervalSince1970: 1744322400)
        
    ])
    func stringFromDate(date: Date) {
        let result = date.toNBPString(locale: .init(identifier: "pl_PL"))
        
        #expect(["2000-02-01",
                 "2024-06-20",
                 "2025-04-11"].contains(result))
    }
}
