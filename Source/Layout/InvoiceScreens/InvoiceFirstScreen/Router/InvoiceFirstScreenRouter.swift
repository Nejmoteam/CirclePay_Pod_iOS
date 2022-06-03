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
    static func createAnModule(invoiceViewModel: InvoiceFirstScreenViewModel) -> UIViewController {
        let interactor = InvoiceFirstScreenInteractor()
        let router = InvoiceFirstScreenRouter()
        let view = InvoiceFirstScreenViewController()
        let presenter = InvoiceFirstScreenPresenter(view: view, interactor: interactor, router: router, invoiceNumber: invoiceViewModel)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func navigateToStepTwo(invoiceViewModel:InvoiceFirstScreenViewModel ,customer: GetCustomerCodable) {
        let stepTwo = InvoiceSecondScreenRouter.createAnModule(invoiceViewModel: invoiceViewModel, customer: customer)
        stepTwo.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.viewController?.present(stepTwo, animated: true, completion: nil)
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
    func navigateToShippingPolicy(shippingPolicy: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let shippingPolicyScene = ShippingPolicyRouter.createAnModule(shippingPolicy: shippingPolicy)
            shippingPolicyScene.modalPresentationStyle = .fullScreen
            self.viewController?.present(shippingPolicyScene, animated: true, completion: nil)
        }
    }
    
    func navigateToRefundPolicy(refundPolicy: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let refundPolicyScene = RefundPolicyRouter.createAnModule(refundPolicy: refundPolicy)
            refundPolicyScene.modalPresentationStyle = .fullScreen
            self.viewController?.present(refundPolicyScene, animated: true, completion: nil)
        }
    }
    
    func dismiss() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.viewController?.dismiss(animated: true, completion: nil)
        }
    }
}
