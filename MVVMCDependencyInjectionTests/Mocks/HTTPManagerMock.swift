//
//  HTTPManagerMock.swift
//  MVVMCDependencyInjectionTests
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation
@testable import MVVMCDependencyInjection

class HTTPManagerMock: HTTPManagerProtocol {
    public func get(url: URL, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let data = Data("The Test Data".utf8)
            completionBlock(.success(data))
        }
    }
}
