//
//  RatesListViewModel.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Combine

protocol RatesListViewModelProtocol: ObservableObject {
    var rates: [Rate] { get }
    var isLoading: Bool { get }
}

final class RatesListViewModel: RatesListViewModelProtocol {
    let testRatesForList: [Rate] = [.init(currency: "bat (Tajlandia)", currencyCode: "THB",averageCourse: 0.114333),
                                    .init(currency: "dolar amerykański", currencyCode: "USD",averageCourse: 3.753655)]
    
    
    @MainActor @Published var rates: [Rate] = []
    @MainActor @Published var isLoading: Bool = true
    
    private let rateManager: any RateManagerProtocol
    
    init(rateManager: any RateManagerProtocol) {
        self.rateManager = rateManager
        
        Task { @MainActor in
            await setupBindings()
        }
    }
    
    @MainActor
    private func setupBindings() async {
        do {
            let ratesList = try await rateManager.ratesList
            var resultList: [Rate] = []
            
            for list in ratesList {
                let transformedRates = list.rates.map { Rate(tableType: list.tableType,
                                                             currency: $0.currency,
                                                             currencyCode: $0.currencyCode,
                                                             averageCourse: $0.averageCourse) }
                
                resultList.append(contentsOf: transformedRates)
            }
            
            rates = resultList
            isLoading = false
        } catch {
            print(error.localizedDescription)
        }
    }
}
