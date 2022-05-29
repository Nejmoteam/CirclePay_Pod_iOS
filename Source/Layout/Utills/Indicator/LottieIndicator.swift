//
//  LottieIndicator.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 29/05/2022.
//


import Foundation
import UIKit

class LottieIndicator: UIView, ActivityIndicatorProtocol {
    lazy var hintLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lottie Indicator"
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.addSubview(self.hintLabel)
        NSLayoutConstraint.activate([
            self.hintLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.hintLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
