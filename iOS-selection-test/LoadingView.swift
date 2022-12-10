//
//  LoadingView.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import SwiftUI

/// Represents the loading view status.
struct LoadingView: View {
    private let description: String
    
    init(description: String) {
        self.description = description
    }
    
    var body: some View {
        VStack {
            Text(description)
                .font(.system(size: Config.FontSize.regular))
                .foregroundColor(Config.Colors.grey)
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(
            description: "Loading Accounts..."
        )
    }
}
