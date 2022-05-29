//
//  Indicator + UIView.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 29/05/2022.
//

import Foundation
import UIKit
protocol ActivityIndicatorProtocol: UIView {}

enum ActivityIndicatorType {
    case _default
    case lottie
}

extension UIView {
    func showActivityIndicator(with type: ActivityIndicatorType, isUserInteractionEnabled: Bool = false, frame: CGRect = .zero, color: UIColor = .white) {
        let activityInticator = self.setupActivityIndicatorType(type, color: color)
        self.setupActivityIndicatorViewFrame(activityInticator: activityInticator, frame: frame)
        self.addSubview(activityInticator)
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }

    func removeActivityIndicator() {
        let indicatorView = self.subviews.filter { $0 is ActivityIndicatorProtocol }
        indicatorView.first?.removeFromSuperview()
        self.isUserInteractionEnabled = true
    }

    private func setupActivityIndicatorType(_ type: ActivityIndicatorType, color: UIColor) -> ActivityIndicatorProtocol {
        type == ._default ? NormalIndicator(color: color) : LottieIndicator()
    }

    private func setupActivityIndicatorViewFrame(activityInticator: ActivityIndicatorProtocol, frame: CGRect) {
        if frame != .zero {
            activityInticator.frame = frame
        } else {
            activityInticator.frame = self.bounds
        }
    }
}
