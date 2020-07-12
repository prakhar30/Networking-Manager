//
//  APIClient.swift
//  Network Manager Example
//
//  Created by Prakhar Tripathi on 12/07/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

public struct APICLient {
    private let session: URLSession
    
    init(config: URLSessionConfiguration) {
        self.session = URLSession(configuration: config)
    }
    
    public func send(request: Request) {
        let urlRequest = request.builder.toURLRequest()
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            let result: Result<Data, APIError>
            if let error = error {
                result = .failure(.networkError(error))
            } else if let apiError = APIError.error(response: response) {
                result = .failure(apiError)
            } else {
                result = .success(data ?? Data())
            }
            
            DispatchQueue.main.async {
                request.completion(result)
            }
        }
        task.resume()
    }
}
