//
//  Decimal+CurrencyString.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

extension Decimal {
    func currencyString() -> String {
        String(format: "%.4f", NSDecimalNumber(decimal: self).floatValue)
    }
}
