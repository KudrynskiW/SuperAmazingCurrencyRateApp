//
//  NBPRatesRepository.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import Foundation

enum NetworkingError: Error {
    case describedError(String)
    case urlError
}

actor NBPRatesRepository {
    private enum Constants {
        static let headerAcceptField = "Accept"
        static let headerAcceptValue = "application/json"
    }
    
    func makeRequest<T: Codable>(model: T.Type,
                                 request: NBPRatesRepositoryRequest,
                                 additionalPath: String? = nil) async throws(NetworkingError) -> T {
        do {
            guard let url = URL(string: request.baseURL + request.path + "/" + (additionalPath ?? "")) else {
                throw NetworkingError.urlError
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = request.httpMethod
            request.setValue(Constants.headerAcceptValue, forHTTPHeaderField: Constants.headerAcceptField)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(T.self, from: data)
            
            return response
        } catch {
            throw .describedError(error.localizedDescription)
        }
    }
}

extension NBPRatesRepository: NBPRatesRepositoryProtocol {
    func getTable(table: RateDetails.TableType) async throws -> RatesList {
        try await makeRequest(model: RatesList.self,
                              request: GetTableRequest(),
                              additionalPath: table.rawValue)
    }
    
    func getRateDetails(table: RateDetails.TableType, currencyCode: String, dateFrom: Date, dateTo: Date) async throws -> RateDetails {
        let additionalPath = "\(table.rawValue)/\(currencyCode)/\(dateFrom)/\(dateTo)"
        return try await makeRequest(model: RateDetails.self,
                                     request: GetRateDetailsRequest(),
                                     additionalPath: additionalPath)
    }
}
