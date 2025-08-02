//
//  Coordinator.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

enum Page: Hashable, Identifiable {
    case ratesList, rateDetails(Rate)
    
    var id: String {
        switch self {
        case .ratesList:
            return "ratesList"
        case .rateDetails(let rate):
            return "rateDetails\(rate.id)"
        }
    }
}

final class Coordinator: ObservableObject {
    let rateManager = RateManager(repository: NBPRatesRepository())
    
    @Published var path = NavigationPath()
    
    func push(page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .ratesList:
            let viewModel = RatesListViewModel(rateManager: rateManager)
            RatesListView(vm: { viewModel })
        case .rateDetails(let rate):
            let viewModel = RateDetailsViewModel(rate: rate, rateManager: rateManager)
            RateDetailsView(vm: { viewModel })
        }
    }
    
}
