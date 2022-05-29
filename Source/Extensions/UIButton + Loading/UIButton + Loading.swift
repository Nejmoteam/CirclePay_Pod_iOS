//
//  UIButton + Loading.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 29/05/2022.
//

import Foundation
import UIKit

extension UIButton {
    func showLoading(color: UIColor = .white) {
        self.setTitle("", for: .normal)
        self.showActivityIndicator(with: ._default, color: color)
        UIApplication.shared.beginIgnoringInteractionEvents()
    }

    func hideLoading(with title: String) {
        self.setTitle(title, for: .normal)
        self.removeActivityIndicator()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
