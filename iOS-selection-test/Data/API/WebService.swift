//
//  WebService.swift
//  iOS Example
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation

enum WebService {
    case access
    case config
    case accounts
    
    var request: Router.Request {
        switch self {
        case .access:
            return Router.Request.access
        case .config:
            return Router.Request.config
        case .accounts:
            return Router.Request.accounts
        }
    }
}
