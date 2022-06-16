//
//  WebViewProtocols.swift
//  Pods
//
//  Created Alchemist on 31/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol WebViewViewProtocol: AnyObject {
    var presenter: WebViewPresenterProtocol! {get set}
    func openUrl(url: String)
}
protocol WebViewPresenterProtocol {
    var view: WebViewViewProtocol? {get set}
    func viewDidLoad()
    func transactionPaidSucsesfully()
    func failedToPayTransaction()
    func userTappedTryAgainInPaymentStatus()
}
protocol WebViewRouterProtocol {
    func presentInvoicePaymentStatusScreen(result: InvoicePaymentStatus,invoiceViewModel: InvoiceFirstScreenViewModel)
    func userTappedTryAgainInPaymentStatus()

}
protocol WebViewInteractorInPutProtocol {
    var presenter: WebViewInteractorOutPutProtocol? {get set}
}
protocol WebViewInteractorOutPutProtocol:AnyObject {
}
