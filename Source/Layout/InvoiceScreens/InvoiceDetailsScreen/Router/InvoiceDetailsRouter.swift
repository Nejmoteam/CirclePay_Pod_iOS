//
//  InvoiceDetailsRouter.swift
//  Pods
//
//  Created apple on 25/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceDetailsRouter: InvoiceDetailsRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createAnModule(invoiceViewModel: InvoiceFirstScreenViewModel, customer: CustomerCodable) -> UIViewController {
        let interactor = InvoiceDetailsInteractor()
        let router = InvoiceDetailsRouter()
        let view = InvoiceDetailsViewController()
        let presenter = InvoiceDetailsPresenter(view: view, interactor: interactor, router: router,invoiceViewModel: invoiceViewModel, customer: customer)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func dismissView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.viewController?.dismiss(animated: true, completion: nil)
        }
    }
}
