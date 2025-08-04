//
//  RateDetailsView.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

struct RateDetailsView<VM: RateDetailsViewModelProtocol>: View {
    @ObservedObject private var viewModel: VM
    
    init(vm: @escaping () -> VM) {
        self._viewModel = ObservedObject(wrappedValue: vm())
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.rateDetails?.getSortedRates() ?? [], id: \.self) { rate in
                    RateDetailsListCellView(rate: rate,
                                            isMoreThanTenPercentDifference: viewModel.isMoreThanTenPercentFromLatest(rate: rate))
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .controlSize(.extraLarge)
                }
            }
        }
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .task { await viewModel.onAppear() }
    }
}

#Preview {
    RateDetailsView(vm: { RateDetailsViewModel(rate: .init(tableType: .a, publicationDate: "2025-07-15", currencyCode: "GBP", averageCourse: 4.8942), rateManager: RateManager(repository: NBPRatesRepository())) })
}
