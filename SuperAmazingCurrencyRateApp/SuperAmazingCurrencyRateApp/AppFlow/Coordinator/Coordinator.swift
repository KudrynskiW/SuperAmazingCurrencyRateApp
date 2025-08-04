//
//  Coordinator.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

enum Page: Hashable, Identifiable {
    case ratesList
    case rateDetails(Rate)
    
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
    let coordinatorComponentsFactory: any CoordinatorComponentsFactoryProtocol
    @Published var path = NavigationPath()
    
    init(coordinatorComponentsFactory: any CoordinatorComponentsFactoryProtocol, path: NavigationPath = NavigationPath()) {
        self.coordinatorComponentsFactory = coordinatorComponentsFactory
        self.path = path
    }
    
    func push(page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @MainActor
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .ratesList:
            RatesListView(vm: { [unowned self] in
                RatesListViewModel(rateManager: self.coordinatorComponentsFactory.prepareRateManager())
            })
        case .rateDetails(let rate):
            RateDetailsView(vm: { [unowned self] in
                RateDetailsViewModel(rate: rate,
                                     rateManager: self.coordinatorComponentsFactory.prepareRateManager())
            })
        }
    }
    
}
