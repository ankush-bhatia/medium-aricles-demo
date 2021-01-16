//
//  Responder.swift
//  swift-responder-chain
//
//  Created by Ankush Bhatia on 16/01/21.
//

import Foundation

protocol Responder: AnyObject {

    // Make sure to make it weak while implementing it
    var responder: Responder? { get set }
    func didReceiveEvent(_ event: ResponderEvent, from model: ResponderViewModel?)
}

extension Responder {

    func didReceiveEvent(_ event: ResponderEvent, from model: ResponderViewModel?) {
        responder?.didReceiveEvent(event, from: model)
    }
}
