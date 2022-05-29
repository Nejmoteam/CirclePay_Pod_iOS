//
//  InvoiceListInteractor.swift
//  CirclePay_Pod_iOS
//
//  Created apple on 29/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
import CirclePay_Pod_iOS
class InvoiceListInteractor: InvoiceListInteractorInPutProtocol {
   weak var presenter: InvoiceListInteractorOutPutProtocol?
    
    func getInoviceList(customerMobile:String?) {
        CirclePay.invoices.listInvoices(customerMobile: customerMobile) { list, error in
            if let unwrappedError = error {
                self.presenter?.failedToGetList(error: unwrappedError)
            } else if let unwrappedList = list{
                self.presenter?.didGetInvoiceList(data: unwrappedList)
            }
        }
    }
}
