//
//  PaymentType.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation
import SwiftUI

/// Represents the payment type.
enum PaymentType {
    case `internal`
    case isr
    case qrBill
    case external
}

extension PaymentType {
    public var color: Color {
        switch self {
        case .internal:
            return Config.Colors.lightBlue
        case .isr:
            return Config.Colors.gold
        case .qrBill:
            return Config.Colors.darkGrey
        case .external:
            return Config.Colors.green
        }
    }
    
    public var title: String {
        switch self {
        case .internal:
            return "INTERNAL"
        case .isr:
            return "ISR"
        case .qrBill:
            return "QR-BILL"
        case .external:
            return "EXTERNAL"
        }
    }
}
