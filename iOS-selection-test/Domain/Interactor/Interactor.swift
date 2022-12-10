//
//  Interactor.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation
import Combine

protocol Interactor {
    
    /// Verify if access is available
    /// -  Returns: true if is possible to retrieve accounts list otherwise false.
    func access() -> AnyPublisher<Access, Never>
    
    /// Get the bank accounts list.
    /// -  Returns: List of accounts.
    func accounts() -> AnyPublisher<[Account], Error>
}
