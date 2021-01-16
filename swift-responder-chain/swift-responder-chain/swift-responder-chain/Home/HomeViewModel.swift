//
//  HomeViewModel.swift
//  swift-responder-chain
//
//  Created by Ankush Bhatia on 17/01/21.
//

import Foundation

protocol HomeViewUpdtable: AnyObject {

    func didReceiveRefreshEvent()
    func didReceiveTapEvent(with tapViewModel: TapViewModel)
}

final class HomeViewModel: Responder {

    weak var responder: Responder?
    weak var view: HomeViewUpdtable?
}

extension HomeViewModel {

    func didReceiveEvent(_ event: ResponderEvent,
                         from model: ResponderViewModel?) {
        switch event {
            case .tap:
                guard let tapViewModel = model as? TapViewModel else {
                    return
                }
                view?.didReceiveTapEvent(with: tapViewModel)
            case .refresh:
                view?.didReceiveRefreshEvent()
            default:
                break
        }
    }
}
