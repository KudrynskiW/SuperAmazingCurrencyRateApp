//
//  CoordinatorComponentsFactoryProtocol.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

protocol CoordinatorComponentsFactoryProtocol {
    func prepareRateManager() -> RateManagerProtocol
}
