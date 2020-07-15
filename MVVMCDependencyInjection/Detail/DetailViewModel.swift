//
//  DetailViewModel.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 04/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation

class DetailViewModel {
    private var networkManager: HTTPManagerProtocol?
    init(coordinator: RootCoordinator?, networkManager: HTTPManagerProtocol) {
        self.networkManager = networkManager
    }
}
