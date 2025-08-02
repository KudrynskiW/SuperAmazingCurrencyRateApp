//
//  CoordinatorFactoryProtocol.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

protocol CoordinatorFactoryProtocol {
    func prepareRateManager() -> RateManagerProtocol
}
