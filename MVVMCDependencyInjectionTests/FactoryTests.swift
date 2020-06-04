//
//  FactoryTests.swift
//  MVVMCDependencyInjectionTests
//
//  Created by Steven Curtis on 04/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import XCTest
@testable import MVVMCDependencyInjection

class FactoryTests: XCTestCase {

    var dependencyFactory: DependencyFactory?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dependencyFactory = DependencyFactory()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // It doesn't make any sense to test the dependency factory, as it is this class that is replaced for the tests    
}

