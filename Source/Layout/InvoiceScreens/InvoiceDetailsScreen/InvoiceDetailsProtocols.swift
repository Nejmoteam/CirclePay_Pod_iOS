//
//  InvoiceDetailsProtocols.swift
//  Pods
//
//  Created apple on 25/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol InvoiceDetailsViewProtocol: class {
    var presenter: InvoiceDetailsPresenterProtocol! {get set}
    
}
protocol InvoiceDetailsPresenterProtocol {
    var view: InvoiceDetailsViewProtocol? {get set}
    
    func viewDidLoad()
    func dismissView()
    func configureCell(cell:InvoiceDetailsPaymentSammaryTableViewCellView)
    func configureCell(cell:InvoiceDetailsProductTableViewCellView, at indexPath:IndexPath)
}
protocol InvoiceDetailsRouterProtocol {
    func dismissView()
}
protocol InvoiceDetailsInteractorInPutProtocol {
    var presenter: InvoiceDetailsInteractorOutPutProtocol? {get set}
}
protocol InvoiceDetailsInteractorOutPutProtocol:class {
}

protocol InvoiceDetailsPaymentSammaryTableViewCellView {
    func configurePaymentSummery(billedFrom: String, billedTo: String)
    func configureTaxView(taxValue: String, taxPersentage: String)
    func configureShipping(shippingValue: String)
    func configureDiscount(discountType: DiscountTypes, discountValue:String, value: String)
    func configureSubTotal(subTotal: String)
    func configureTotal(total: String)
}


protocol InvoiceDetailsProductTableViewCellView {
    func configCell(product: InvoiceItemsCodable)
}
