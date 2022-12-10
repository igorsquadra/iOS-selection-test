//
//  RemoteDataSourceImpl.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation
import Combine

class RemoteDataSourceImpl: RemoteDataSource {
    private let api: API
    
    init(api: API = API()) {
        self.api = api
    }
    
    func access() -> AnyPublisher<AccessResponse, Error> {
        let webService = WebService.access
        return api.get(webService)
    }
    
    func config() -> AnyPublisher<ConfigResponse, Error> {
        let webService = WebService.config
        return api.get(webService)
    }
    
    func accounts() -> AnyPublisher<AccountsResponse, Error> {
        let webService = WebService.accounts
        return api.get(webService)
    }
}
