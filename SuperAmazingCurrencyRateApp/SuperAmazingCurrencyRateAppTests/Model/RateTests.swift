//
//  RateTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation
import Testing

@testable import SuperAmazingCurrencyRateApp

struct RateTests {
    @Test
    func rateModel_fromJSON_overall() throws {
        let overallJSONString = """
        {
            "currency": "afgani (Afganistan)",
            "code": "AFN",
            "mid": 0.053761
        }
        """
        
        let jsonData = overallJSONString.data(using: .utf8)
        let rate: Rate = try JSONDecoder().decode(Rate.self, from: jsonData ?? Data())
        
        #expect(rate.currency == "afgani (Afganistan)")
        #expect(rate.currencyCode == "AFN")
        #expect(rate.averageCourse == 0.053761)
    }
    
    @Test
    func rateModel_fromJSON_details() throws {
        let detailsJSONString = """
        {
            "no": "135/A/NBP/2025",
            "effectiveDate": "2025-07-15",
            "mid": 4.8942
        }
        """
        
        let jsonData = detailsJSONString.data(using: .utf8)
        let rate: Rate = try JSONDecoder().decode(Rate.self, from: jsonData ?? Data())
        
        #expect(rate.tableNumber == "135/A/NBP/2025")
        #expect(rate.publicationDate == "2025-07-15")
        #expect(rate.averageCourse == 4.8942)
    }
}
