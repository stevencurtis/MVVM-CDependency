//
//  NavigationControllerMock.swift
//  MVVMCDependencyInjectionTests
//
//  Created by Steven Curtis on 04/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import UIKit

class UINavigationControllerMock : UINavigationController {
  
  var pushedViewController: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
    
}
