//
//  InvoiceListProtocols.swift
//  CirclePay_Pod_iOS
//
//  Created apple on 29/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
import CirclePay_Pod_iOS
protocol InvoiceListViewProtocol: AnyObject {
    var presenter: InvoiceListPresenterProtocol! {get set}
    
    func reloadTableView()
}
protocol InvoiceListPresenterProtocol {
    var view: InvoiceListViewProtocol? {get set}
    
    func viewDidLoad()
    func numberOfRows() -> Int
    func cellTitle(at indexPath:IndexPath) -> String
    func didSelectCell(at indexPath:IndexPath)
    func dismissView()
}
protocol InvoiceListRouterProtocol {
   func dismissView()
    func excutePayment(invoiceNumber:String)
}
protocol InvoiceListInteractorInPutProtocol {
    var presenter: InvoiceListInteractorOutPutProtocol? {get set}
    
    func getInoviceList(customerMobile:String?)
}
protocol InvoiceListInteractorOutPutProtocol:AnyObject {
    func didGetInvoiceList(data:[InvoiceCodable])
    func failedToGetList(error:CirclePayError)
}
