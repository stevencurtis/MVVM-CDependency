//
//  ProjectCoordinatorTests.swift
//  MVVMCDependencyInjectionTests
//
//  Created by Steven Curtis on 04/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import XCTest
@testable import MVVMCDependencyInjection

class ProjectCoordinatorTests: XCTestCase {

    var coordinator: ProjectCoordinator?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let factory = FactoryMock()
        coordinator = ProjectCoordinator(factory: factory)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 struct UnexpectedNilError: Error {}
    
    func testCoord() throws {
        let nav = UINavigationControllerMock()
        coordinator?.start(nav)
        guard (nav.pushedViewController as? InitialViewController) != nil else {throw UnexpectedNilError() }
    }

}
