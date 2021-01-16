//
//  TapView.swift
//  swift-responder-chain
//
//  Created by Ankush Bhatia on 17/01/21.
//

import UIKit

class TapView: UIView {

    weak var responder: Responder?
    var viewModel: TapViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        addGestureRecognizer(tapGesture)
        accessibilityIdentifier = "TapView"
    }

    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        viewModel?.incrementNoOfTaps()
        responder?.didReceiveEvent(.tap, from: viewModel)
    }
}
