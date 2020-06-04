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
    func makeInitialViewModel(coordinator: Coordinator) -> InitialViewModel
    func makeInitialView(viewModel: InitialViewModel) -> InitialView
    func makeDetailView(viewModel: DetailViewModel) -> DetailView
    func makeDetailViewModel(coordinator: Coordinator) -> DetailViewModel
}

// replace the DependencyContainer for tests
class DependencyFactory: Factory {
    var networkManager: HTTPManagerProtocol = HTTPManager()
    
    // should not return an optional at the end of this project
    func makeInitialCoordinator() -> ProjectCoordinator {
        let coordinator = ProjectCoordinator(factory: self)
        return coordinator
    }
    
    func makeInitialView(viewModel: InitialViewModel) -> InitialView {
        let view = InitialView()
        return view
    }
    
    func makeInitialViewModel(coordinator: Coordinator) -> InitialViewModel {
        let viewModel = InitialViewModel(coordinator: coordinator, networkManager: networkManager)
        return viewModel
    }
    
    func makeDetailView(viewModel: DetailViewModel) -> DetailView {
        let view = DetailView()
        return view
    }
    
    func makeDetailViewModel(coordinator: Coordinator) -> DetailViewModel {
        let viewModel = DetailViewModel(coordinator: coordinator, networkManager: networkManager)
        return viewModel
    }
}
