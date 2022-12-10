//
//  AccountsResponse.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation

/// Represents the accounts list response.
struct AccountsResponse: Decodable {
    public let items: [AccountResponse]
}
