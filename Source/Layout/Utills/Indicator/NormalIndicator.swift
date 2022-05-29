//
//  NormalIndicator.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 29/05/2022.
//

import Foundation
import UIKit

class NormalIndicator: UIView, ActivityIndicatorProtocol {
    lazy var activityIndicator: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView(style: .white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = .clear
        indicator.startAnimating()
        return indicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.layoutUserInterFace()
    }

    init(color: UIColor) {
        super.init(frame: .zero)
        self.activityIndicator.color = color
        self.backgroundColor = .clear
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubViews() {
        self.addSubview(self.activityIndicator)
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        NSLayoutConstraint.activate([
            self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicator.heightAnchor.constraint(equalToConstant: 50),
            self.activityIndicator.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

