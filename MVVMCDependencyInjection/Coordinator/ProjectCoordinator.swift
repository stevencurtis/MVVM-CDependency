//
//  ProjectCoordinator.swift
//  MVCC
//
//  Created by Steven Curtis on 02/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

class ProjectCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController?
    
    private var factory: Factory

    init(factory: Factory) {
        self.factory = factory
    }

    func start(_ navigationController: UINavigationController) {
        let vc = InitialViewController(factory: factory, coordinator: self)
        self.navigationController = navigationController
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveToDetail() {
        let vc = DetailViewController(factory: factory, coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
}



