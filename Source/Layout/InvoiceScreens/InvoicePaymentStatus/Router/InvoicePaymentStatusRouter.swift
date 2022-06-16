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
    var delegete: InvoicePaymentStatusNavigationDelegete?
    
    static func createAnModule(with status:InvoicePaymentStatus,invoiceViewModel: InvoiceFirstScreenViewModel,withDelegete:UIViewController?) -> UIViewController {
        let interactor = InvoicePaymentStatusInteractor()
        let router = InvoicePaymentStatusRouter()
        let view = InvoicePaymentStatusViewController()
        let presenter = InvoicePaymentStatusPresenter(view: view, interactor: interactor, router: router, status:status, invoiceViewModel: invoiceViewModel)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        if let unwrappedDelegete = withDelegete as? InvoicePaymentStatusNavigationDelegete {
            router.delegete = unwrappedDelegete
        }
        return view
    }
    
    func dismissView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            //            self.viewController?.dismiss(animated: true, completion: nil)
            self.viewController?.dismissAll(animated: true)
        }
    }
    
    func navigateToStepOneScreen(invoiceViewModel: InvoiceFirstScreenViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            //Navigating to The StepoNE Screen
            self.viewController?.dismiss(animated: true, completion: {
                guard let delegete = self.delegete else {
                    return
                }
                self.delegete?.tryAgain()
                
            })
            
        }
    }
    
    func navigateToInvoiceDetails(invoiceViewModel: InvoiceFirstScreenViewModel, customer: GetCustomerCodable) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let invoiceDetails = InvoiceDetailsRouter.createAnModule(invoiceViewModel: invoiceViewModel, customer: customer)
            invoiceDetails.modalPresentationStyle = .fullScreen
            self.viewController?.present(invoiceDetails, animated: true, completion: nil)
        }
    }
    
}

enum InvoicePaymentStatus {
    case success
    case paid
    case notAvailable
    case failure
}
