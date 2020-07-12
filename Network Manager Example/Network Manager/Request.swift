//
//  Request.swift
//  Network Manager Example
//
//  Created by Prakhar Tripathi on 12/07/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
public struct Request {
    let builder: RequestBuilder
    let completion: (Result<Data, APIError>) -> Void
    
    init(builder: RequestBuilder, completion: @escaping (Result<Data, APIError>) -> Void) {
        self.builder = builder
        self.completion = completion
    }
    
    public static func basic(method: HTTPMethod = .get,
                             baseURL: URL, path: String,
                             params: [URLQueryItem]? = nil,
                             completion: @escaping (Result<Data, APIError>) -> Void) -> Request {
        let builder = BasicRequestBuilder(method: method, baseURL: baseURL, path: path, params: params)
        return Request(builder: builder, completion: completion)
    }
}
