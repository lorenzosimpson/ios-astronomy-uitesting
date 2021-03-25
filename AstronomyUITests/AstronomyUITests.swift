//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lorenzo on 3/25/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    private var app: XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        return app
    }
    
    private var firstChild: XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: 0)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSaveToPhotoLibrary() {
        app.launch()
        
        let cell = firstChild
        cell.tap()
        
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        saveButton.tap()
        
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
    
    func testGoToNextSol() {
        app.launch()
        
        let nextButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        nextButton.tap()
        
        XCTAssertTrue(app.staticTexts["Sol 16"].exists)
    }
    
    func testGoToPreviousSol() {
        app.launch()
        
        let prevButton = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
        prevButton.tap()
        
        XCTAssertTrue(app.staticTexts["Sol 14"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
