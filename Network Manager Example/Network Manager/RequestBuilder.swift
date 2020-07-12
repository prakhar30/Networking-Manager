//
//  RequestBuilder.swift
//  Network Manager Example
//
//  Created by Prakhar Tripathi on 12/07/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
public protocol RequestBuilder {
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var params: [URLQueryItem]? { get }
    var headers: [String: String] { get }
    
    func toURLRequest() -> URLRequest
    func encodeRequestBody() -> Data?
}

public extension RequestBuilder {
    func toURLRequest() -> URLRequest {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        components.queryItems = params
        
        let url = components.url!
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue.uppercased()
        return request
    }
    
    func encodeRequestBody() -> Data? {
        return nil
    }
}
