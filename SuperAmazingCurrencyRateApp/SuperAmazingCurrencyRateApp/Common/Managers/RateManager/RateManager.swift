//
//  RateManager.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

actor RateManager {
    let repository: NBPRatesRepositoryProtocol
    
    init(repository: NBPRatesRepositoryProtocol) {
        self.repository = repository
    }
}

extension RateManager: RateManagerProtocol {
    var ratesList: [RatesList] {
        get async throws {
            try await withThrowingTaskGroup(of: RatesList?.self) { [weak self] group in
                guard let self else { return [] }
                
                for table in RateDetails.TableType.allCases {
                    group.addTask { try await self.repository.getTable(table: table).first }
                }
                
                var result: [RatesList?] = []
                for try await list in group {
                    result.append(list)
                }
                
                return result.compactMap { $0 }
            }
        }
    }
    
    func getRateDetails(table: RateDetails.TableType,
                        currencyCode: String,
                        dateFrom: Date,
                        dateTo: Date) async throws -> RateDetails {
        try await repository.getRateDetails(table: table,
                                            currencyCode: currencyCode,
                                            dateFrom: dateFrom,
                                            dateTo: dateTo)
    }
    
}
