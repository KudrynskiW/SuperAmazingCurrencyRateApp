//
//  RateDetailsTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation
import Testing

@testable import SuperAmazingCurrencyRateApp

struct RateDetailsTests {
    @Test
    func rateDetails_fromJSON() throws {
        let rateDetailsJSONString = """
        {
            "table": "A",
            "currency": "funt szterling",
            "code": "GBP",
            "rates": [
                {
                    "no": "135/A/NBP/2025",
                    "effectiveDate": "2025-07-15",
                    "mid": 4.8942
                }
            ]
        }
        """
        
        let jsonData = rateDetailsJSONString.data(using: .utf8)
        let rateDetails: RateDetails = try JSONDecoder().decode(RateDetails.self, from: jsonData ?? Data())
        
        #expect(rateDetails.tableType == .a)
        #expect(rateDetails.currency == "funt szterling")
        #expect(rateDetails.currencyCode == "GBP")
        #expect(rateDetails.rates == [Rate(tableNumber: "135/A/NBP/2025",
                                           publicationDate: "2025-07-15",
                                           averageCourse: 4.8942)])
    }
}
