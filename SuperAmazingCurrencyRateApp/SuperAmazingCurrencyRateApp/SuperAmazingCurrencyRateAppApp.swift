//
//  SuperAmazingCurrencyRateAppApp.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

@main
struct SuperAmazingCurrencyRateAppApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = NBPRatesRepository()
            let rateManager = RateManager(repository: repository)
            let viewModel = RatesListViewModel(rateManager: rateManager)
            RatesListView(vm: { viewModel })
        }
    }
}
