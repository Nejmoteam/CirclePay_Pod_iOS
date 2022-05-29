//
//  InvoiceListRouter.swift
//  CirclePay_Pod_iOS
//
//  Created apple on 29/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
import CirclePay_Pod_iOS

class InvoiceListRouter: InvoiceListRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createAnModule() -> UIViewController {
        let interactor = InvoiceListInteractor()
        let router = InvoiceListRouter()
        let view = InvoiceListViewController()
        let presenter = InvoiceListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func dismissView() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
    
    func excutePayment(invoiceNumber: String) {
        CirclePay.delegete = self
        CirclePay.excutePayment(with: .Invoice(invoiceNumber: invoiceNumber))
    }
}

extension InvoiceListRouter: CirclePayDelegete {
    func didGetErrorAtCheckoutProcess(error: CirclePayError) {
        print(error)
    }
    
    func didPaidTransactionSucsessfully(transactionId: String) {
        print(transactionId)
    }
    
    func didGetErrorAtPayingTransaction(error: CirclePayError) {
        print(error)
    }
    
    
}
