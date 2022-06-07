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
}

enum InvoicePaymentStatus {
    case success
    case failure
}
