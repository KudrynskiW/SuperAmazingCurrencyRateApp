//
//  GetTableRequestTests.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Testing

@testable import SuperAmazingCurrencyRateApp

struct GetTableRequestTests {
    @Test
    func properInitialized() {
        let getTableRequest = GetTableRequest()
        
        #expect(getTableRequest.baseURL == "https://api.nbp.pl/api/exchangerates/")
        #expect(getTableRequest.path == "tables")
        #expect(getTableRequest.httpMethod == .get)
    }
}
