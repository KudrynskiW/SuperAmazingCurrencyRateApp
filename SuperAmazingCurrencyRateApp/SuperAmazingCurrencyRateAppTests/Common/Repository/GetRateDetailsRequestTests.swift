//
//  GetRateDetailsRequestTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Testing

@testable import SuperAmazingCurrencyRateApp

struct GetRateDetailsRequestTests {
    @Test
    func properInitialized() {
        let getRateDetailsRequest = GetRateDetailsRequest()
        
        #expect(getRateDetailsRequest.baseURL == "https://api.nbp.pl/api/exchangerates/")
        #expect(getRateDetailsRequest.path == "rates")
        #expect(getRateDetailsRequest.httpMethod == .get)
    }
}
