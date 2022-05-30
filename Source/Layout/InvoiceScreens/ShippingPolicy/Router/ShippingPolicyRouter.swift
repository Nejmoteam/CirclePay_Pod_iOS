//
//  ShippingPolicyRouter.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class ShippingPolicyRouter: ShippingPolicyRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule( shippingPolicy: String) -> UIViewController {
        let interactor = ShippingPolicyInteractor()
        let router = ShippingPolicyRouter()
        let view = ShippingPolicyViewController()
        let presenter = ShippingPolicyPresenter(view: view, interactor: interactor, router: router, shippingPolicy: shippingPolicy)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    func dismissViewController() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.viewController?.dismiss(animated: true, completion: nil)
        }
    }
}
