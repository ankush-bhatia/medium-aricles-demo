//
//  TapViewModelTests.swift
//  swift-responder-chainTests
//
//  Created by Ankush Bhatia on 17/01/21.
//

import XCTest
@testable import swift_responder_chain

class TapViewModelTests: XCTestCase {

    var tapViewModel: TapViewModel!

    override func setUp() {
        super.setUp()
        tapViewModel = TapViewModel()
    }

    func testNoOfTapsText() throws {
        tapViewModel.incrementNoOfTaps()
        tapViewModel.incrementNoOfTaps()

        let text = tapViewModel.tapText()
        XCTAssert(text == "You tapped times: 2")
    }

    override func tearDown() {
        super.tearDown()
        tapViewModel = nil
    }

}
