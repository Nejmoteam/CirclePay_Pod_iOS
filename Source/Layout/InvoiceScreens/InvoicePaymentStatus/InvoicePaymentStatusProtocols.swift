//
//  InvoicePaymentStatusProtocols.swift
//  Pods
//
//  Created apple on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol InvoicePaymentStatusViewProtocol: AnyObject {
    var presenter: InvoicePaymentStatusPresenterProtocol! {get set}
    
    func setupView(with status:InvoicePaymentStatus)
    func setInvoiceNumber(value:String)
    func setInvoicePaymentDate(value:String)
    func configureColor(stringColor: String)
    func setupLogoConfigurations(isLogoEnabled:Bool, logoUrl: String)

}
protocol InvoicePaymentStatusPresenterProtocol {
    var view: InvoicePaymentStatusViewProtocol? {get set}
    
    func viewDidLoad()
    func userPressedTryAgain()
    func userPressedDownload()
    func userPressedViewInvoiceDetails()
    func userPressedDismiss()
}
protocol InvoicePaymentStatusRouterProtocol {
    func dismissView()
    func navigateToStepOneScreen(invoiceViewModel: InvoiceFirstScreenViewModel)
    func navigateToInvoiceDetails(invoiceViewModel: InvoiceFirstScreenViewModel, customer: CustomerCodable)
}
protocol InvoicePaymentStatusInteractorInPutProtocol {
    var presenter: InvoicePaymentStatusInteractorOutPutProtocol? {get set}
}
protocol InvoicePaymentStatusInteractorOutPutProtocol:AnyObject {
}


protocol InvoicePaymentStatusNavigationDelegete {
    func tryAgain()
}
