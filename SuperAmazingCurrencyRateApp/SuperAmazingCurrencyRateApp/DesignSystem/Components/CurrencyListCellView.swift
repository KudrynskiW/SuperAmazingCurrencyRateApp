//
//  CurrencyListCellView.swift
//  SuperAmazingCurrencyRateApp
//
//  Created by Wojciech Kudrynski on 02/08/2025.
//

import SwiftUI

struct CurrencyListCellView: View {
    private enum Constants {
        static let noValuePlaceholder = "---"
    }
    let rate: Rate
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(rate.currencyCode ?? Constants.noValuePlaceholder)
                    .bold()
                Text(rate.currency ?? Constants.noValuePlaceholder)
            }
            
            Spacer()
            
            Text("\(rate.averageCourse.currencyString()) PLN")
        }
    }
}


#Preview {
    CurrencyListCellView(rate: .init(currency: "dolar amerykański", currencyCode: "USD",averageCourse: 3.75367))
}
