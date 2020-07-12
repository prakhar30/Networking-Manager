//
//  MovieDBConfiguration.swift
//  Network Manager Example
//
//  Created by Prakhar Tripathi on 12/07/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
struct MovieDBConfiguration: Model {
    struct Images: Model {
        let baseUrl: URL
        let secureBaseUrl: URL
        let backdropSizes: [String]
        let logoSizes: [String]
        let posterSizes: [String]
        let profileSizes: [String]
        let stillSizes: [String]
    }
    
    let images: Images
}
