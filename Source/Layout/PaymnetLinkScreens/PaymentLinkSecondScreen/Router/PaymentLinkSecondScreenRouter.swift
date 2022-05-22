//
//  PaymentLinkSecondScreenRouter.swift
//  Pods
//
//  Created Alchemist on 22/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class PaymentLinkSecondScreenRouter: PaymentLinkSecondScreenRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule() -> UIViewController {
        let interactor = PaymentLinkSecondScreenInteractor()
        let router = PaymentLinkSecondScreenRouter()
        let view = PaymentLinkSecondScreenViewController()
        let presenter = PaymentLinkSecondScreenPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
