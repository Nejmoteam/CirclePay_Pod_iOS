//
//  InvoiceFirstScreenProtocols.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol InvoiceFirstScreenViewProtocol: class {
    var presenter: InvoiceFirstScreenPresenterProtocol! {get set}
    func configurePaymentSummery(billedFrom: String, billedTo: String)
    func configureTaxView(taxValue: String, taxPersentage: String)
    
    func configureShipping(shippingValue: String)
    func configureDiscount(discountPercentage: String, value: String)
    func configureInvoiceDate(date: String)
    func configureSubTotal(subTotal: String)
    func configureTotal(total: String)


}
protocol InvoiceFirstScreenPresenterProtocol {
    var view: InvoiceFirstScreenViewProtocol? {get set}
    func viewDidLoad()
    func navigateToStepTwo()
    func navigateToInvoiceDetails()
}
protocol InvoiceFirstScreenRouterProtocol {
    func navigateToStepTwo(invoiceViewModel:InvoiceFirstScreenViewModel ,customer: GetCustomerCodable)
    func navigateToInvoiceDetails(invoiceViewModel: InvoiceFirstScreenViewModel, customer: GetCustomerCodable)
}
protocol InvoiceFirstScreenInteractorInPutProtocol {
    var presenter: InvoiceFirstScreenInteractorOutPutProtocol? {get set}
}
protocol InvoiceFirstScreenInteractorOutPutProtocol:class {
}
