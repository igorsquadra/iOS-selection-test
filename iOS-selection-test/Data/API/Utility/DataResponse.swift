//
//  DataResponse.swift
//  
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation

public class DataResponse<T: Decodable>: Decodable {
    public let success: Bool?
    public let failure: Bool?
    public let data: T
    
    init(
        success: Bool = false,
        failure: Bool = false,
        data: T
    ) {
        self.success = success
        self.failure = failure
        self.data = data
    }
}
