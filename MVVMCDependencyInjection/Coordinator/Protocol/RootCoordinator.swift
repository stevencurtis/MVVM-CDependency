//
//  Coordinator.swift
//  MVCC
//
//  Created by Steven Curtis on 02/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

protocol RootCoordinator: class {
    func start(_ navigationController: UINavigationController)
    func moveToDetail()
}
