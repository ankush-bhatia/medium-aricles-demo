//
//  swift_responder_chainUITests.swift
//  swift-responder-chainUITests
//
//  Created by Ankush Bhatia on 16/01/21.
//

import XCTest

class swift_responder_chainUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testTapsTextUpdate() throws {
        app.launch()
        let tapView = app.otherElements["TapView"]
        tapView.tap()
        tapView.tap()
        tapView.tap()
        let informationLabel = app.staticTexts["informationLabel"]
        XCTAssert(informationLabel.label == "You tapped times: 3")
    }
}
