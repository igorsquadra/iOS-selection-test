//
//  AccountsViewVM.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation
import Combine

class AccountsViewVM: ObservableObject {
    @Published var accounts: [Account]?
    @Published var status: Status = .loading
    @Published var showingPaymentAlert: Bool = false
    public var paymentAlertType: PaymentType?
    private let interactor: Interactor
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: Interactor) {
        self.interactor = interactor
        loadData()
    }
    
    public func loadData() {
        status = .loading
        
        interactor.access()
            .tryAllSatisfy({ access in
                self.status = access.paymentsAvailable ? .loading : .error
                return access.paymentsAvailable
            })
            .flatMap({ access -> AnyPublisher<[Account], Error> in
                return self.interactor.accounts()
            })
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.status = .error
                case .finished:
                    self.status = .loaded
                }
            }, receiveValue: { accounts in
                self.accounts = accounts
            })
            .store(in: &cancellables)
    }
    
    public func createPayment(_ paymentType: PaymentType) {
        paymentAlertType = paymentType
        showingPaymentAlert = true
    }
}
