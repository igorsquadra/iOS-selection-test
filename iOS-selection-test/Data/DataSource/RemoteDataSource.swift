//
//  RemoteDataSource.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation
import Combine

protocol RemoteDataSource {
    
    /// Verify if access is available
    /// -  Returns: true if is possible to retrieve accounts list otherwise false.
    func access() -> AnyPublisher<AccessResponse, Error>
    
    /// Get companies list divided by payment type.
    /// -  Returns: list of companies.
    func config() -> AnyPublisher<ConfigResponse, Error>
    
    /// Get the bank accounts list.
    /// -  Returns: List of accounts.
    func accounts() -> AnyPublisher<AccountsResponse, Error>
}
