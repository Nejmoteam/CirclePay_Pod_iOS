//
//  InvoiceSecondScreenRouter.swift
//  Pods
//
//  Created Alchemist on 24/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceSecondScreenRouter: InvoiceSecondScreenRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule(invoiceViewModel:InvoiceFirstScreenViewModel ,customer: GetCustomerCodable) -> UIViewController {
        let interactor = InvoiceSecondScreenInteractor()
        let router = InvoiceSecondScreenRouter()
        let view = InvoiceSecondScreenViewController()
        let presenter = InvoiceSecondScreenPresenter(view: view, interactor: interactor, router: router,invoiceViewModel: invoiceViewModel ,customer: customer)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
