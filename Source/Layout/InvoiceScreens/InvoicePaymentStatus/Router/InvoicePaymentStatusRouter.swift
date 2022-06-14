//
//  InvoicePaymentStatusRouter.swift
//  Pods
//
//  Created apple on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoicePaymentStatusRouter: InvoicePaymentStatusRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createAnModule(with status:InvoicePaymentStatus) -> UIViewController {
        let interactor = InvoicePaymentStatusInteractor()
        let router = InvoicePaymentStatusRouter()
        let view = InvoicePaymentStatusViewController()
        let presenter = InvoicePaymentStatusPresenter(view: view, interactor: interactor, router: router, status:status)
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

enum InvoicePaymentStatus {
    case success
    case paid
    case notAvailable
    case failure
}
