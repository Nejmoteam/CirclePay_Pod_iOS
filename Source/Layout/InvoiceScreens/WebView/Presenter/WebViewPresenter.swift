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
    private var transactionId: String

    init(view: WebViewViewProtocol, interactor: WebViewInteractorInPutProtocol, router: WebViewRouterProtocol, webViewUrl: String,transactionId: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.webViewUrl = webViewUrl
        self.transactionId = transactionId
    }
    func viewDidLoad() {
        print("ViewDidLoad")
        self.view?.openUrl(url: self.webViewUrl)
    }
    
    func transactionPaidSucsesfully() {
        CirclePay.delegete?.didPaidTransactionSucsessfully(transactionId: self.transactionId)
        self.router.presentInvoicePaymentStatusScreen(result: .success)

    }
    func failedToPayTransaction() {
        CirclePay.delegete?.didGetErrorAtPayingTransaction(error: CirclePayError(errorCode: 0000, errorMsg: "Something went wrong, please try again"))
        self.router.presentInvoicePaymentStatusScreen(result: .failure)
    }
}
