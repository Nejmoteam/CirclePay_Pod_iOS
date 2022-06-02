//
//  InvoiceDetailsProtocols.swift
//  Pods
//
//  Created apple on 25/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol InvoiceDetailsViewProtocol: AnyObject {
    var presenter: InvoiceDetailsPresenterProtocol! {get set}
    //UI Configuration
    func setupPrimaryColorConfiguration(colorString: String)
}
protocol InvoiceDetailsPresenterProtocol {
    var view: InvoiceDetailsViewProtocol? {get set}
    
    func viewDidLoad()
    func dismissView()
    func configureCell(cell:InvoiceDetailsPaymentSammaryTableViewCellView)
    func configureCell(cell:InvoiceDetailsProductTableViewCellView, at indexPath:IndexPath)
    func numberOfItems() -> Int
}
protocol InvoiceDetailsRouterProtocol {
    func dismissView()
}
protocol InvoiceDetailsInteractorInPutProtocol {
    var presenter: InvoiceDetailsInteractorOutPutProtocol? {get set}
}
protocol InvoiceDetailsInteractorOutPutProtocol:AnyObject {
}

protocol InvoiceDetailsPaymentSammaryTableViewCellView {
    func configurePaymentSummery(billedFrom: String, billedTo: String)
    func configureTaxView(taxValue: String, taxPersentage: String)
    func configureShipping(shippingValue: String)
    func configureDiscount(discountType: DiscountTypes, discountValue:String, value: String)
    func configureSubTotal(subTotal: String)
    func configureTotal(total: String)
    
    func setupPrimaryColorConfiguration(colorString: String)
    func setupBilledFromConfiguration(isEnabled: Bool)
    func setupBilledToConfiguration(isEnabled: Bool)
    func setupTotalAmountConfiguration(isEnabled: Bool)
    func setupAccountingConfiguration(isEnabled:Bool)
}


protocol InvoiceDetailsProductTableViewCellView {
    func configCell(product: InvoiceItemsCodable)
}
