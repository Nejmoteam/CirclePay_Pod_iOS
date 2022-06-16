//
//  InvoiceListPresenter.swift
//  CirclePay_Pod_iOS
//
//  Created apple on 29/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
import CirclePay_Pod_iOS
class InvoiceListPresenter: InvoiceListPresenterProtocol, InvoiceListInteractorOutPutProtocol {
    weak var view: InvoiceListViewProtocol?
    private let interactor: InvoiceListInteractorInPutProtocol
    private let router: InvoiceListRouterProtocol
    private var invoiceList = [InvoiceCodable]()
    init(view: InvoiceListViewProtocol, interactor: InvoiceListInteractorInPutProtocol, router: InvoiceListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        print("ViewDidLoad")
        interactor.getInoviceList(customerMobile: "+201061140960")
    }
    
    func numberOfRows() -> Int {
        invoiceList.count
    }
    
    func cellTitle(at indexPath: IndexPath) -> String {
        guard invoiceList.count > 0, indexPath.item < invoiceList.count else{
           return ""
        }
        return invoiceList[indexPath.item].invoiceNumber ?? ""
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        guard let unwrappedInvoiceNumber = invoiceList[indexPath.item].invoiceNumber else{
           return
        }
        router.excutePayment(invoiceNumber: unwrappedInvoiceNumber)
    }
    
    func didGetInvoiceList(data: [InvoiceCodable]) {
        self.invoiceList = data
        self.view?.reloadTableView()
    }
    
    func failedToGetList(error: CirclePayError) {
        print(error)
    }
    
    func dismissView() {
        router.dismissView()
    }
}
