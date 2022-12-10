//
//  NetworkErrors.swift
//  
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation

enum NetworkError: Error {
    case serverError(statusCode: Int?)
    case requestFormatError
    case noDataReceived
    case decodingError(DecodingError)
    case unknowError(Error)
}
