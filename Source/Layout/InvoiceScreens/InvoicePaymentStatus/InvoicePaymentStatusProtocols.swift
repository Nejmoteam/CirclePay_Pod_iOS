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
}
protocol InvoicePaymentStatusInteractorInPutProtocol {
    var presenter: InvoicePaymentStatusInteractorOutPutProtocol? {get set}
}
protocol InvoicePaymentStatusInteractorOutPutProtocol:AnyObject {
}
