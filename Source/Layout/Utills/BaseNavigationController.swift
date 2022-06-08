//
//  BaseNavigationController.swift
//  Alamofire
//
//  Created by Alchemist on 07/06/2022.
//

import Foundation
import UIKit

internal class BaseNavigationController: UINavigationController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
        interactivePopGestureRecognizer?.delegate = self
        self.interactivePopGestureRecognizer?.delegate = self
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension BaseNavigationController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
