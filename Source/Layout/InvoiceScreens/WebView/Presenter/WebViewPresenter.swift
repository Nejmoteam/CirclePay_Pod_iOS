//
//  WebViewPresenter.swift
//  Pods
//
//  Created Alchemist on 31/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class WebViewPresenter: WebViewPresenterProtocol, WebViewInteractorOutPutProtocol {
    weak var view: WebViewViewProtocol?
    private let interactor: WebViewInteractorInPutProtocol
    private let router: WebViewRouterProtocol
    private var webViewUrl: String
    private var transaction: TransactionResult
    private var invoiceViewModel: InvoiceFirstScreenViewModel

    init(view: WebViewViewProtocol, interactor: WebViewInteractorInPutProtocol, router: WebViewRouterProtocol, webViewUrl: String,transaction: TransactionResult,invoiceViewModel: InvoiceFirstScreenViewModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.webViewUrl = webViewUrl
        self.transaction = transaction
        self.invoiceViewModel = invoiceViewModel
    }
    func viewDidLoad() {
        print("ViewDidLoad")
        self.view?.openUrl(url: self.webViewUrl)
    }
    
    func transactionPaidSucsesfully() {
        transaction.transactoinStatus = "PAID"
        CirclePay.delegete?.didPaidTransactionSucsessfully(transaction: self.transaction)
        self.router.presentInvoicePaymentStatusScreen(result: .success, invoiceViewModel: self.invoiceViewModel)

    }
    func failedToPayTransaction() {
        transaction.transactoinStatus = "UNPAID"
        CirclePay.delegete?.didGetErrorAtPayingTransaction(transaction: self.transaction, error: CirclePayError(errorCode: 0000, errorMsg: "Something went wrong during the payment process, please try again"))
        self.router.presentInvoicePaymentStatusScreen(result: .failure, invoiceViewModel: self.invoiceViewModel)
    }
    
    func userTappedTryAgainInPaymentStatus() {
        self.router.userTappedTryAgainInPaymentStatus()
    }
}
