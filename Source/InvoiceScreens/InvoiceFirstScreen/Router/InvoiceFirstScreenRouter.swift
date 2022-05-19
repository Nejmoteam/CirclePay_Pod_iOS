//
//  InvoiceFirstScreenRouter.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceFirstScreenRouter: InvoiceFirstScreenRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule() -> UIViewController {
        let interactor = InvoiceFirstScreenInteractor()
        let router = InvoiceFirstScreenRouter()
        let view = InvoiceFirstScreenViewController()
        let presenter = InvoiceFirstScreenPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
