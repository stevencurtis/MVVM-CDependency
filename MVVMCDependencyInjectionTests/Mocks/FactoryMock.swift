import Foundation
@testable import MVVMCDependencyInjection

// replace the DependencyContainer for tests
class FactoryMock: Factory {
    func makeInitialViewController(coordinator: ProjectCoordinator) -> InitialViewController {
        let viewModel = makeInitialViewModel(coordinator: coordinator)
        
        let initialViewController = InitialViewController(coordinator: coordinator, viewModel: viewModel)
        
        return initialViewController
    }
    
    func makeInitialView() -> InitialView {
        let view = InitialView()
        return view
    }
    
    func makeDetailView() -> DetailView {
        let view = DetailView()
        return view
    }
    
    func makeDetailViewModel(coordinator: RootCoordinator) -> DetailViewModel {
        let viewModel = DetailViewModel(coordinator: coordinator, networkManager: networkManager)
        return viewModel
    }
    
    lazy var networkManager: HTTPManagerProtocol = HTTPManager()
    
    // should not return an optional at the end of this project
    func makeInitialCoordinator() -> ProjectCoordinator {
        let coordinator = ProjectCoordinator(factory: self)
         return coordinator
    }

    
    func makeInitialViewModel(coordinator: RootCoordinator) -> InitialViewModel {
        let viewModel = InitialViewModel(coordinator: coordinator, networkManager: networkManager)
        return viewModel
    }
}
