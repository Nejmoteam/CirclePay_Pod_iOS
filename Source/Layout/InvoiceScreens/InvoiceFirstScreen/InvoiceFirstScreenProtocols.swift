//
//  InvoiceFirstScreenProtocols.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol InvoiceFirstScreenViewProtocol: AnyObject {
    var presenter: InvoiceFirstScreenPresenterProtocol! {get set}
    func configurePaymentSummery(billedFrom: String, billedTo: String)
    func configureTaxView(taxValue: String, taxPersentage: String)
    
    func configureShipping(shippingValue: String)
    func configureDiscount(discountType: DiscountTypes, discountValue:String, value: String)
    func configureInvoiceDate(date: String)
    func configureSubTotal(subTotal: String)
    func configureTotal(total: String)
    
    //UI Configuration
    func setupLogoConfigurations(isLogoEnabled:Bool, logoUrl: String)
    func setupPrimaryColorConfiguration(colorString: String)
    func setupBilledFromConfiguration(isEnabled: Bool)
    func setupBilledToConfiguration(isEnabled: Bool)
    func setupTotalAmountConfiguration(isEnabled: Bool)
    func setupAccountingConfiguration(isEnabled:Bool)
    func setupShippingPolicyConfiguration(isEnabled: Bool)
    func setupRefundPolicyConfiguration(isEnabled: Bool)



}
protocol InvoiceFirstScreenPresenterProtocol {
    var view: InvoiceFirstScreenViewProtocol? {get set}
    func viewDidLoad()
    func navigateToStepTwo()
    func navigateToInvoiceDetails()
    func navigateToShippingPolicy()
    func navigateToRefundPolicy()
    func dismiss()
}
protocol InvoiceFirstScreenRouterProtocol {
    func navigateToStepTwo(invoiceViewModel:InvoiceFirstScreenViewModel ,customer: GetCustomerCodable)
    func navigateToInvoiceDetails(invoiceViewModel: InvoiceFirstScreenViewModel, customer: GetCustomerCodable)
    func navigateToShippingPolicy(shippingPolicy: String)
    func navigateToRefundPolicy(refundPolicy: String)
    func dismiss()
    
}
protocol InvoiceFirstScreenInteractorInPutProtocol {
    var presenter: InvoiceFirstScreenInteractorOutPutProtocol? {get set}
}
protocol InvoiceFirstScreenInteractorOutPutProtocol:AnyObject {
}
