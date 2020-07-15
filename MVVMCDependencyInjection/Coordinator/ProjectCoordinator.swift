//
//  ProjectCoordinator.swift
//  MVCC
//
//  Created by Steven Curtis on 02/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

class ProjectCoordinator: AbstractCoordinator, RootCoordinator {
    private(set) var childCoordinators: [AbstractCoordinator] = []
    // The reference is weak to prevent a retain cycle
    weak var navigationController: UINavigationController?
    private var factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
    
    func addChildCoordinator(_ coordinator: AbstractCoordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    /// Start the coordinator, intiializing dependencies
    /// - Parameter navigationController: The host UINavigationController
    func start(_ navigationController: UINavigationController) {        
        let vc = factory.makeInitialViewController(coordinator: self)
        self.navigationController = navigationController
        navigationController.pushViewController(vc, animated: true)
    }
        
    /// Move to the DetailView
    func moveToDetail() {
        let vc = DetailViewController(factory: factory, coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
}



