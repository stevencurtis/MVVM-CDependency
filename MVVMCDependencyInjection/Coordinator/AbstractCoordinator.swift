//
//  AbstractCoordinator.swift
//  MVVMCDependencyInjection
//
//  Created by Steven Curtis on 12/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation

protocol AbstractCoordinator {
    func addChildCoordinator(_ coordinator: AbstractCoordinator)
    func removeAllChildCoordinatorsWith<T>(type: T.Type)
    func removeAllChildCoordinators()
}
