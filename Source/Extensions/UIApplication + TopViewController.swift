//
//  UIApplication + TopViewController.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 19/05/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func topMostViewController() -> UIViewController {
        guard let presentedViewController = presentedViewController else {
            return self
        }
        if let navigation = presentedViewController as? UINavigationController {
            if let visibleViewController = navigation.visibleViewController {
                return visibleViewController.topMostViewController()
            }
        }
        if let tab = presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return presentedViewController.topMostViewController()
    }
}

extension UIApplication {
    func topMostViewController() -> UIViewController? {
        keyWindow?.rootViewController?.topMostViewController()
    }
}
