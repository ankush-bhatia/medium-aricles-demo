//
//  HomeViewController.swift
//  swift-responder-chain
//
//  Created by Ankush Bhatia on 16/01/21.
//

import UIKit

class HomeViewController: UIViewController {

    // This view is taken as a separate class to demonstrate how events from views can propagate to the super class without strong binding of the viewModels specific to that view.
    @IBOutlet weak var tapView: TapView!

    private(set) var viewModel: HomeViewModel?
    @IBOutlet weak var informationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initialBuild()
        informationLabel.accessibilityIdentifier = "informationLabel"
    }

    // This can be moved to a builder that will take care of doing the initial setup. For the sake of simplicity and understanding I am writing it here.
    private func initialBuild() {
        viewModel = HomeViewModel()
        viewModel?.view = self
        let tapViewModel = TapViewModel()
        tapViewModel.responder = viewModel
        tapView.viewModel = tapViewModel
        tapView.responder = tapViewModel
    }
}

extension HomeViewController: HomeViewUpdtable {

    func didReceiveTapEvent(with tapViewModel: TapViewModel) {
        informationLabel.text = tapViewModel.tapText()
    }

    func didReceiveRefreshEvent() {
        // Refresh the view controller or execute the something that needs to be refreshed.
    }
}
