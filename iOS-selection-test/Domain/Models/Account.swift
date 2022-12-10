//
//  Account.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation

/// Represents the bank account.
struct Account {
    public let id: String
    public let iban: String
    public let accountNumber: String
    public let name: String?
    public let company: String
    public let amount: String
    public let currency: String
    public var paymentTypes: [PaymentType]
}
