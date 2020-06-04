//
//  HTTPManager.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation

protocol HTTPManagerProtocol {
    func get(url: URL, completionBlock: @escaping (Result<Data, Error>) -> Void)
}

class HTTPManager: HTTPManagerProtocol {
    public func get(url: URL, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let data = Data("The Data from HTTPManager".utf8)
            completionBlock(.success(data))
        }
    }
}

