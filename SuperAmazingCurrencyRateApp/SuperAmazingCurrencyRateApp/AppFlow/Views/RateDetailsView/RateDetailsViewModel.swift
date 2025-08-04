//
//  RateDetailsViewModel.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation
import Combine

protocol RateDetailsViewModelProtocol: ObservableObject {
    var navigationTitle: String { get }
    var rateDetails: RateDetails? { get }
    var isLoading: Bool { get }
    
    func onAppear() async
    func isMoreThanTenPercentFromLatest(rate: Rate) -> Bool
}

final class RateDetailsViewModel: RateDetailsViewModelProtocol {
    @MainActor @Published var rateDetails: RateDetails?
    @MainActor @Published var navigationTitle: String = ""
    @MainActor @Published var isLoading: Bool = true
    
    private let sourceRate: Rate
    private let rateManager: any RateManagerProtocol
    
    init(rate: Rate,
         rateManager: any RateManagerProtocol) {
        self.sourceRate = rate
        self.rateManager = rateManager
    }
    
    @MainActor
    func onAppear() async {
        guard let rateTableType = sourceRate.tableType,
              let rateCurrencyCode = sourceRate.currencyCode else { return }
        
        do {
            let twoWeeksEarlier = Calendar.current.date(byAdding: .weekOfMonth, value: -2, to: .now) ?? .now
            rateDetails = try await rateManager.getRateDetails(table: rateTableType, currencyCode: rateCurrencyCode, dateFrom: twoWeeksEarlier, dateTo: .now)
            
            if let rateDetails {
                navigationTitle = rateDetails.currency.capitalized + "(" + rateDetails.currencyCode.uppercased() + ")"
            }
            
            isLoading = false
        } catch {
            print(error)
        }
    }
    
    func isMoreThanTenPercentFromLatest(rate: Rate) -> Bool {
        let isLower = rate.averageCourse < (sourceRate.averageCourse*0.9)
        let isHigher = rate.averageCourse > (sourceRate.averageCourse*1.1)
        return isLower || isHigher
    }
}
