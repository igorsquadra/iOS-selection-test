//
//  Config.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation
import SwiftUI

struct Config {
    static let baseURL: String = "https://6388651da4bb27a7f78508b4.mockapi.io/"
    
    struct Colors {
        static let grey: Color = Color(hex: 0x8A99A1)
        static let darkGrey: Color = Color(hex: 0x778994)
        static let lightBlue: Color = Color(hex: 0x4EA2D1)
        static let green: Color = Color(hex: 0x78956B)
        static let gold: Color = Color(hex: 0xC0A87C)
        static let darkGold: Color = Color(hex: 0xB18567)
    }
    
    struct FontSize {
        static let small: CGFloat = 16.0
        static let regular: CGFloat = 18.0
        static let big: CGFloat = 22.0
        static let huge: CGFloat = 24.0
    }
}
