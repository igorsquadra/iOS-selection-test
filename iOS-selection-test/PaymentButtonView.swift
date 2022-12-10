//
//  PaymentButtonView.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import SwiftUI

/// Represents the payment button in accounts list.
struct PaymentButtonView: View {
    private let color: Color
    private let text: String
    private let onTap: () -> Void
    
    init(color: Color, text: String, onTap: @escaping () -> Void) {
        self.color = color
        self.text = text
        self.onTap = onTap
    }
    
    var body: some View {
        Button(action: onTap) {
            Text(text)
                .font(.system(size: Config.FontSize.small))
                .fontWeight(.bold)
                .padding(.all, 3)
                .frame(minWidth: 50)
            
        }
        .tint(color)
        .controlSize(.small)
        .buttonStyle(.borderedProminent)
    }
}

struct PaymentButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PaymentButtonView(
                color: Color(hex: 0x4EA2D1),
                text: "INTERNAL",
                onTap: {}
            )
            PaymentButtonView(
                color: Color(hex: 0xC0A87C),
                text: "ISR",
                onTap: {}
            )
            PaymentButtonView(
                color: Color(hex: 0x778994),
                text: "QR-BILL",
                onTap: {}
            )
            PaymentButtonView(
                color: Color(hex: 0x78956B),
                text: "EXTERNAL",
                onTap: {}
            )
        }
    }
}
