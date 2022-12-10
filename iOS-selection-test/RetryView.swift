//
//  RetryView.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import SwiftUI

/// Represents the error view status.
struct RetryView: View {
    private let description: String
    private let buttonText: String
    private let onTap: () -> Void
    
    init(description: String, buttonText: String, onTap: @escaping () -> Void) {
        self.description = description
        self.buttonText = buttonText
        self.onTap = onTap
    }
    
    var body: some View {
        VStack {
            Text(description)
                .font(.system(size: Config.FontSize.huge))
                .foregroundColor(Config.Colors.grey)
            Button(action: onTap) {
                Text(buttonText)
                    .fontWeight(.bold)
                    .padding(.all, 3)
                    .frame(minWidth: 50)
                
            }
            .tint(Config.Colors.grey)
            .controlSize(.regular)
            .buttonStyle(.borderedProminent)
        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(
            description: "Accounts are not accessible",
            buttonText: "Tap to retry",
            onTap: {}
        )
    }
}
