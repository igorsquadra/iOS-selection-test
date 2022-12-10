//
//  InteractorImpl.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation
import Combine

class InteractorImpl: Interactor {
    private let dataSource: RemoteDataSource
    
    init(dataSource: RemoteDataSource = RemoteDataSourceImpl()) {
        self.dataSource = dataSource
    }
    
    func access() -> AnyPublisher<Access, Never> {
        return dataSource.access()
            .replaceError(with: AccessResponse(paymentsAvailable: false))
            .map({ accessResponse in
                return Access(paymentsAvailable: accessResponse.paymentsAvailable)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func accounts() -> AnyPublisher<[Account], Error> {
        Publishers.Zip(dataSource.config(), dataSource.accounts())
            .map { (configResponse, accountsResponse) in
                let accounts = accountsResponse.items.map { account in
                    return Account(
                        id: account.id,
                        iban: account.iban,
                        accountNumber: account.accountNumber,
                        name: account.name,
                        company: account.company,
                        amount: account.amount,
                        currency: account.currency,
                        paymentTypes: account.paymentTypes(forConfigResponse: configResponse)
                    )
                }
                
                return accounts
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
