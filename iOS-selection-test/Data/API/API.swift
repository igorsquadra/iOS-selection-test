//
//  API.swift
//  iOS Example
//
//  Created by Igor Squadra on 09/12/22.
//

import Foundation
import Combine

public class API {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get<T: Decodable>(_ webService: WebService) -> AnyPublisher<T, Error> {
        guard let urlRequest = webService.request.urlRequest() else {
            return Fail(error: NetworkError.requestFormatError).eraseToAnyPublisher()
        }
        
        return self.session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                
                guard let code = statusCode, (200..<300) ~= code else {
                    throw NetworkError.serverError(statusCode: statusCode)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
