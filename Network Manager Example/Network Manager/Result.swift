//
//  Result.swift
//  Network Manager Example
//
//  Created by Prakhar Tripathi on 12/07/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
public extension Result where Success == Data, Failure == APIError {
    func decoding<M: Model>(_ model: M.Type, completion: @escaping (Result<M, APIError>) -> Void) {
        DispatchQueue.global().async {
            let result = self.flatMap { data -> Result<M, APIError> in
                do {
                    let decoder = M.decoder
                    let model = try decoder.decode(M.self, from: data)
                    return .success(model)
                } catch let e as DecodingError {
                    return .failure(.decodingError(e))
                } catch {
                    return .failure(.unhandledResponse)
                }
            }
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
