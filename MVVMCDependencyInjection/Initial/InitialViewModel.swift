//
//  InitialViewModel.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation

final class InitialViewModel {
    private var networkManager: HTTPManagerProtocol?
    init(coordinator: RootCoordinator?, networkManager: HTTPManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchData(completion: @escaping (Result<[InitialModel], Error>) -> Void) {
        networkManager?.get(url: URL(string: "NOURL")!, completionBlock: { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let data):
                    if let str = String(data: data, encoding: .utf8) {
                        let model = InitialModel(dataString: str)
                        completion(.success([model]))
                    }
                }
            }
        })
    }
}
