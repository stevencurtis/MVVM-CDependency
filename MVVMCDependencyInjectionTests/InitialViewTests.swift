//
//  InitialViewTests.swift
//  MVVMCDependencyInjectionTests
//
//  Created by Steven Curtis on 04/06/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import XCTest
@testable import MVVMCDependencyInjection

class InitialViewTests: XCTestCase {
    
    var initialView: InitialView?

    override func setUpWithError() throws {
       initialView = InitialView()
    }
    

//    In general unit testing views isn't the right thing to do. Unit testing is meant to validate discrete atoms of logic, and if you're factoring your code properly there should be very little logic in your views.
    
    func testTraverseButtonView() {
        // if the initial view isn't put in a container, the subviews will naturally be positioned at (0,0)
        let initialFrame = initialView?.traverseButton.frame
        let expectedFrame = CGRect(x: 0, y: 0, width: 200, height: 100)
        XCTAssertEqual(initialFrame, expectedFrame)
    }
    
    func testInitialLabelText() {
        XCTAssertEqual(initialView!.networkLabel.text, "No network calls made")
    }
    
    func testInitialTraverseButtonText() {
        XCTAssertEqual(initialView!.traverseButton.titleLabel!.text, "Go to Detail")
    }
    
    func testInitialNetworkButtonText() {
        XCTAssertEqual(initialView!.networkButton.titleLabel!.text, "Make Network Call")
    }
    
    func testTraverseButtonContainerView() {
        let containerView = UIView(frame: CGRect(x: 10, y: 0, width: 500, height: 1000))
        containerView.addSubview(initialView!)
        
        initialView?.translatesAutoresizingMaskIntoConstraints = false
        
        initialView?.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        initialView?.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        initialView?.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        initialView?.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        containerView.layoutIfNeeded()
        print (containerView)
        
        let initialFrame = initialView?.frame
        let expectedFrame = CGRect(x: 0, y: 0, width: 500, height: 1000)
        XCTAssertEqual(initialFrame, expectedFrame)
        XCTAssertEqual(initialView!.networkLabel.text, "No network calls made")
    }

}
