//
//  RefundPolicyRouter.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class RefundPolicyRouter: RefundPolicyRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule(refundPolicy: String) -> UIViewController {
        let interactor = RefundPolicyInteractor()
        let router = RefundPolicyRouter()
        let view = RefundPolicyViewController()
        let presenter = RefundPolicyPresenter(view: view, interactor: interactor, router: router, refundPolicy: refundPolicy)
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
