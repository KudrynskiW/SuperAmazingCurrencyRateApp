//
//  RateDetailsListCellView.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

struct RateDetailsListCellView: View {
    let rate: Rate
    let isMoreThanTenPercentDifference: Bool
    var body: some View {
        HStack {
            Text(rate.publicationDate ?? "")
            Spacer()
            Text(rate.averageCourse.currencyString())
                .foregroundStyle(isMoreThanTenPercentDifference ? .red : .black)
        }
    }
}

#Preview {
    RateDetailsListCellView(rate: .init(publicationDate: "2025-08-01", averageCourse: 0.1234), isMoreThanTenPercentDifference: true)
}
