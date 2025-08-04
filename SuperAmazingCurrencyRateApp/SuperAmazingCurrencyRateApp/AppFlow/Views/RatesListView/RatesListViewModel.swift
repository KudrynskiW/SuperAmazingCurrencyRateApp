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
    
    func onAppear() async
}

final class RatesListViewModel: RatesListViewModelProtocol {
    @MainActor @Published var rates: [Rate] = []
    @MainActor @Published var isLoading: Bool = true
    
    private let rateManager: any RateManagerProtocol
    private var onAppearCalled: Bool = false
    
    init(rateManager: any RateManagerProtocol) {
        self.rateManager = rateManager
    }
    
    @MainActor
    func onAppear() async {
        guard !onAppearCalled else { return }
        onAppearCalled = true
        
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
