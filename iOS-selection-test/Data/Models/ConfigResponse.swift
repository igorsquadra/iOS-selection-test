//
//  ConfigResponse.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation

/// Represents the companies list for which payment types are available.
struct ConfigResponse: Decodable {
    private let dcCompanies: String
    private let chCompanies: String
    private let xtCompanies: String
    
    public var dcList: [String] {
        return dcCompanies.components(separatedBy: ",")
    }
    public var chList: [String] {
        return chCompanies.components(separatedBy: ",")
    }
    public var xtList: [String] {
        return xtCompanies.components(separatedBy: ",")
    }
}
