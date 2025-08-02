//
//  CoordinatorView.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator(coordinatorFactory: CoordinatorFactory())
    
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .ratesList)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }.environmentObject(coordinator)
    }
}
