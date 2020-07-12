//
//  ViewController.swift
//  Network Manager Example
//
//  Created by Prakhar Tripathi on 12/07/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = MovieDB.api
        api.send(request: .popularMovies(completion: { (result) in
            switch result {
            case .success(let page): print(page)
            case .failure(let error): print(error)
            }
        }))
    }
}
