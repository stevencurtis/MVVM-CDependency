//
//  DependencyContainer.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation

protocol Factory {
    var networkManager: HTTPManagerProtocol { get }
    func makeInitialViewController(coordinator: ProjectCoordinator) -> InitialViewController
    func makeInitialViewModel(coordinator: RootCoordinator) -> InitialViewModel
    func makeDetailView() -> DetailView
    func makeDetailViewModel(coordinator: RootCoordinator) -> DetailViewModel
}

// replace the DependencyContainer for tests
class DependencyFactory: Factory {
    func makeInitialViewController(coordinator: ProjectCoordinator) -> InitialViewController {
        let viewModel = makeInitialViewModel(coordinator: coordinator)
        let initialViewController = InitialViewController(coordinator: coordinator, viewModel: viewModel)
        return initialViewController
    }
    
    var networkManager: HTTPManagerProtocol = HTTPManager()
    
    func makeInitialCoordinator() -> ProjectCoordinator {
        let coordinator = ProjectCoordinator(factory: self)
        return coordinator
    }
    
    func makeInitialViewModel(coordinator: RootCoordinator) -> InitialViewModel {
        let viewModel = InitialViewModel(coordinator: coordinator, networkManager: networkManager)
        return viewModel
    }
}

extension DependencyFactory {
    func makeDetailView() -> DetailView {
        let view = DetailView()
        return view
    }
    
    func makeDetailViewModel(coordinator: RootCoordinator) -> DetailViewModel {
        let viewModel = DetailViewModel(coordinator: coordinator, networkManager: networkManager)
        return viewModel
    }
}
