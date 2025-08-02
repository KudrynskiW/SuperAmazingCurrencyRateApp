//
//  RatesListView.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

struct RatesListView<VM: RatesListViewModelProtocol>: View {
    @StateObject private var viewModel: VM
    @EnvironmentObject private var coordinator: Coordinator
    
    init(vm: @escaping () -> VM) {
        self._viewModel = StateObject(wrappedValue: vm())
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.rates, id: \.self) { rate in
                    Button {
                        coordinator.push(page: .rateDetails(rate))
                    } label: {
                        CurrencyListCellView(rate: rate)
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .controlSize(.extraLarge)
                }
            }
            .navigationTitle("SuperAmazing Currency Rate App")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RatesListView(vm: { RatesListViewModel(rateManager: RateManager(repository: NBPRatesRepository())) })
}
