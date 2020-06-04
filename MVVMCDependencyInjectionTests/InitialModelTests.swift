//
//  InitialModelTests.swift
//  InitialModelTests
//
//  Created by Steven Curtis on 03/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import XCTest
@testable import MVVMCDependencyInjection

class InitialModelTests: XCTestCase {
    var initialViewModel: InitialViewModel?
    override func setUpWithError() throws {
        let factory = FactoryMock()
        let coordinator = ProjectCoordinator(factory: factory)
        initialViewModel = InitialViewModel(coordinator: coordinator, networkManager: HTTPManagerMock())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModel() {
        let expectation = XCTestExpectation(description: #function)
        initialViewModel?.fetchData(completion: {result in
            switch result {
            case .failure:
                XCTFail()
            case .success(let data):
                expectation.fulfill()
                XCTAssertEqual(data[0].dataString, "The Test Data")
            }
        })
        wait(for: [expectation], timeout: 3.0)
    }
}

