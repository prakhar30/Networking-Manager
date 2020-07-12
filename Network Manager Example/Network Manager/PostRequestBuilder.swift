//
//  PostRequestBuilder.swift
//  Network Manager Example
//
//  Created by Prakhar Tripathi on 12/07/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
struct PostRequestBuilder<Body: Model>: RequestBuilder {
    var method: HTTPMethod
    var baseURL: URL
    var path: String
    var params: [URLQueryItem]?
    var headers: [String: String] = [:]
    var body: Body?
    
    init(method: HTTPMethod = .post,
         baseURL: URL, path: String,
         params: [URLQueryItem]? = nil,
         body: Body? = nil) {
        self.method = method
        self.baseURL = baseURL
        self.path = path
        self.params = params
        self.body = body
    }
}

extension PostRequestBuilder {
    func encodeRequestBody() -> Data? {
        guard let body = body else { return nil }
        
        do {
            let encoder = Body.encoder
            return try encoder.encode(body)
        } catch {
            print("Error encoding body \(error)")
            return nil
        }
    }
}
