//
//  RatesListTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation
import Testing

@testable import SuperAmazingCurrencyRateApp

struct RatesListTests {
    @Test
    func rateList_fromJSON() throws {
        let rateListJSONString = """
        {
            "table": "A",
            "no": "148/A/NBP/2025",
            "effectiveDate": "2025-08-01",
            "rates": [
                {
                    "currency": "bat (Tajlandia)",
                    "code": "THB",
                    "mid": 0.1143
                }
            ]
        }
        """
        
        let jsonData = rateListJSONString.data(using: .utf8)
        let rateList: RatesList = try JSONDecoder().decode(RatesList.self, from: jsonData ?? Data())
        
        #expect(rateList.tableType == .a)
        #expect(rateList.tableNumber == "148/A/NBP/2025")
        #expect(rateList.publicationDate == "2025-08-01")
        #expect(rateList.rates == [Rate(currency: "bat (Tajlandia)",
                                        currencyCode: "THB",
                                        averageCourse: 0.1143)])
    }
}
