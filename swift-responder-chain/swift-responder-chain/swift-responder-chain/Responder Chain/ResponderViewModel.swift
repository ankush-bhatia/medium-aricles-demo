//
//  ResponderViewModel.swift
//  swift-responder-chain
//
//  Created by Ankush Bhatia on 16/01/21.
//

import Foundation

// All the view models are Responder
class ResponderViewModel: NSObject, Responder, Identifiable {

    // MARK: - Properties
    let id: UUID
    weak var responder: Responder?

    override init() {
        self.id = UUID()
        super.init()
    }

    init(with id: UUID) {
        self.id = id
        super.init()
    }

    // MARK: - Responder chain
    func didReceiveEvent(_ event: ResponderEvent, from model: ResponderViewModel?) {
        responder?.didReceiveEvent(event, from: self)
    }

    // Override this in child class if required.
    func didSetNextResponder() {}

    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Self {
            return id == other.id
        } else {
            return false
        }
    }

    override var hash: Int {
        return id.hashValue
    }
}
