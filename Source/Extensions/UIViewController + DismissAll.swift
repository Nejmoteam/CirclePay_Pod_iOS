//
//  UIViewController + DismissAll.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 03/06/2022.
//

import Foundation
import UIKit
extension UIViewController {

    func dismissAll(animated: Bool, completion: (() -> Void)? = nil) {
        if let optionalWindow = UIApplication.shared.delegate?.window, let window = optionalWindow, let rootViewController = window.rootViewController, let presentedViewController = rootViewController.presentedViewController  {
            if let snapshotView = window.snapshotView(afterScreenUpdates: false) {
                presentedViewController.view.addSubview(snapshotView)
                presentedViewController.modalTransitionStyle = .coverVertical
            }
            if !isBeingDismissed {
                rootViewController.dismiss(animated: animated, completion: completion)
            }
        }
    }
    
    func showDefaultAlert(title: String?, message: String?, actionTitle: String?, actionBlock: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let action = UIAlertAction(title: actionTitle, style: .default) { _ in
                alertController.dismiss(animated: true)
                actionBlock?()
            }

            alertController.addAction(action)
            self?.present(alertController, animated: true)
        }
    }

}

