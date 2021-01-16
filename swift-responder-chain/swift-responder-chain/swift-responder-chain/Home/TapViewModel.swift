//
//  TapViewModel.swift
//  swift-responder-chain
//
//  Created by Ankush Bhatia on 17/01/21.
//

import Foundation

class TapViewModel: ResponderViewModel {

    private var noOfTaps: Int = 0

    func tapText() -> String {
        "You tapped times: \(noOfTaps)"
    }

    func incrementNoOfTaps() {
        noOfTaps += 1
    }
}
