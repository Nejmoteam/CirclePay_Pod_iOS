//
//  InvoiceSecondScreenProtocols.swift
//  Pods
//
//  Created Alchemist on 24/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol InvoiceSecondScreenViewProtocol: AnyObject {
    var presenter: InvoiceSecondScreenPresenterProtocol! {get set}
    
    func reloadPaymentMethodsData()
    func setupCustomerData(customer:CustomerViewModel)
    func openIframeViaSafari(iframeUrl: String)
    func showLoadingForPayButton()
    func hideLoadingForPayButton()
    func enablePayButton()
    func disablePayButton()
}
protocol InvoiceSecondScreenPresenterProtocol {
    var view: InvoiceSecondScreenViewProtocol? {get set}
    func viewDidLoad()
    func numberOfPaymentMethods()-> Int
    func configurePaymentMethodsCell(cell: PaymentMethodsCellView, indexPath: IndexPath)
    func didSelectPaymentMethod(at indexPath: IndexPath)
    func onTapPay()
    func didChangeCountry(countryName: String)
    var updatedCustomerData : GetCustomerCodable? {get set}
}
protocol InvoiceSecondScreenRouterProtocol {
}
protocol InvoiceSecondScreenInteractorInPutProtocol {
    var presenter: InvoiceSecondScreenInteractorOutPutProtocol? {get set}
}
protocol InvoiceSecondScreenInteractorOutPutProtocol:AnyObject {
}

protocol PaymentMethodsCellView {
    func setData(paymentMethod: PaymentMethodsViewModel)
}
