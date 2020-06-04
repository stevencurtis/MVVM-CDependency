import Foundation
@testable import MVVMCDependencyInjection

// replace the DependencyContainer for tests
class FactoryMock: Factory {
    
    lazy var networkManager: HTTPManagerProtocol = HTTPManager()
    
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
}
