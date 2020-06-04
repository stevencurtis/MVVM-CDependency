//
//  InitialViewModel.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation

class InitialViewModel {
    private var networkManager: HTTPManagerProtocol?
    init(coordinator: Coordinator?, networkManager: HTTPManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchData(completion: @escaping (Result<[InitialModel], Error>) -> Void) {
        networkManager?.get(url: URL(string: "NOURL")!, completionBlock: { result in
            DispatchQueue.main.async {
                switch result {
                case .failure:
                    completion(.failure(NSError()))
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
