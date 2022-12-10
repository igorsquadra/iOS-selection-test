//
//  AccountResponse+PaymentTypes.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation


extension AccountResponse {
    
    /// Return payments type for specified account
    public func paymentTypes(forConfigResponse configResponse: ConfigResponse) -> [PaymentType] {
        var paymentTypes: [PaymentType] = [PaymentType]()
        if configResponse.dcList.contains(company) {
            paymentTypes.append(.internal)
        }
        if configResponse.chList.contains(company) {
            paymentTypes.append(contentsOf: [.isr, .qrBill])
        }
        if configResponse.xtList.contains(company) {
            paymentTypes.append(.external)
        }
        return paymentTypes
    }
}
