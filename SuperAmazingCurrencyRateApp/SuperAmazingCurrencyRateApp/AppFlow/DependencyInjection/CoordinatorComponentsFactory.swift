//
//  CoordinatorFactory.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

final class CoordinatorComponentsFactory: CoordinatorComponentsFactoryProtocol {
    func prepareRateManager() -> RateManagerProtocol {
        RateManager(repository: prepareNBPRatesRepository())
    }
    
    private func prepareNBPRatesRepository() -> NBPRatesRepositoryProtocol {
        NBPRatesRepository()
    }
}
