//
//  MovieDB.swift
//  Network Manager Example
//
//  Created by Prakhar Tripathi on 12/07/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

public struct MovieDB {
    public static let baseURL = URL(string: "https://api.themoviedb.org/3/")!
    
    public static var api: APICLient = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization": "Bearer \(kAPIKEY)"]
        return APICLient(config: config)
    }()
}
