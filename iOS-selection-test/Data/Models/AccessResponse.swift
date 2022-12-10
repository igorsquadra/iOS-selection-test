//
//  AccessResponse.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation

/// Represents the payments availability response.
struct AccessResponse: Decodable {
    public let paymentsAvailable: Bool
}
