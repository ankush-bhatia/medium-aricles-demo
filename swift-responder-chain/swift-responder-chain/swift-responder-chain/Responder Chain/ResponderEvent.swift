//
//  ResponderEvent.swift
//  swift-responder-chain
//
//  Created by Ankush Bhatia on 16/01/21.
//

import Foundation

class ResponderEvent: NSObject {

    let rawValue: String
    var userInfo: NSMutableDictionary?

    required init(rawValue: String, userInfo: NSMutableDictionary? = nil) {
        self.rawValue = rawValue
        self.userInfo = userInfo
    }
}

// MARK: - Events
extension ResponderEvent {
    // These are some of the general examples of the events for the app.
    static var refresh: Self {
        Self(rawValue: "responder.event.refresh")
    }

    static var tap: Self {
        Self(rawValue: "responder.event.tap")
    }

    static var didLoad: Self {
        Self(rawValue: "responder.event.didLoad")
    }
}

// MARK: - Overrides
extension ResponderEvent {

    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? ResponderEvent {
            return rawValue == object.rawValue
        }
        return false
    }

    override var hash: Int {
        rawValue.hash
    }
}
