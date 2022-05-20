//
//  PaymentLinkFirstScreenRouter.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class PaymentLinkFirstScreenRouter: PaymentLinkFirstScreenRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule() -> UIViewController {
        let interactor = PaymentLinkFirstScreenInteractor()
        let router = PaymentLinkFirstScreenRouter()
        let view = PaymentLinkFirstScreenViewController()
        let presenter = PaymentLinkFirstScreenPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
