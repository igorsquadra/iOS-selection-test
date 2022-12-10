//
//  AmountView.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import SwiftUI

/// Represents the amount view used in accounts list.
struct AmountView: View {
    private let currency: String
    private let amount: String
    private var integerAndDecimal: (integer: String, decimal: String) {
        let amountParts = amount.split(separator: ".").map(String.init)
        return (integer: amountParts[0], decimal: amountParts[1])
    }
    
    init(currency: String, amount: String) {
        self.currency = currency
        self.amount = amount
    }
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(currency)
                .fontWeight(.bold)
                .font(.system(size: Config.FontSize.regular))
                .foregroundColor(Config.Colors.darkGold)
            Group {
                Text(integerAndDecimal.integer)
                    .font(.system(size: Config.FontSize.big))
                    +
                Text(".") +
                Text(integerAndDecimal.decimal)
                    .font(.system(size: Config.FontSize.small))
            }
        }
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(
            currency: "EUR", amount: "1'001'351.00")
    }
}
