//
//  InitialViewControllerTests.swift
//  MVVMCDependencyInjectionTests
//
//  Created by Steven Curtis on 04/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import XCTest
@testable import MVVMCDependencyInjection


class InitialViewControllerTests: XCTestCase {

    var initialViewController: InitialViewController?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let factory = FactoryMock()
        let coordinator = CoordinatorMock(factory: factory)
        
        let viewModel = factory.makeInitialViewModel(coordinator: coordinator)
        
        initialViewController = InitialViewController(coordinator: coordinator, viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testVC() {
        // Calling loadView is one way to create the view
        initialViewController?.loadView()
        initialViewController!.networkButton( UIButtonMock() )
        
        XCTAssertEqual(initialViewController!.intialView!.networkLabel.text, "No network calls made")

    }


}
