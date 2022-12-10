//
//  Router.swift
//  iOS Example
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation

struct Router {
    
    private struct Endpoint {
        static let access                   = "/access"
        static let config                   = "/config"
        static let accounts                 = "/accounts"
    }
    
    enum Request {
        case access
        case config
        case accounts
        
        private var baseURL: String {
            return Config.baseURL + apiVersion
        }
        
        public var apiVersion: String {
            return "api/v1"
        }
        
        private var method: HTTPMethod {
            switch self {
            case .access, .config, .accounts: return .GET
            }
        }
        
        private var path: String {
            switch self {
            case .access:
                return Endpoint.access
            case .config:
                return Endpoint.config
            case .accounts:
                return Endpoint.accounts
            }
        }
        
        public func urlRequest() -> URLRequest? {
            guard let baseUrl = URL.init(string: baseURL) else { return nil }
            var urlRequest = URLRequest.init(url: baseUrl.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            
            return urlRequest
        }
    }
}
