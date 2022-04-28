//
//  Invoices.swift
//  Alamofire
//
//  Created by apple on 08/04/2022.
//

import Foundation
public protocol InvoicesProtocol {
    func createInvoice(invoiceNumber:String?,items: [Items], customerMobile:String, status:Int?, createDate:String?, dueDate:String, prefPaymentMethod:String?, shippingFees:Double?, discountValue:Double?, discountType:String?, discountValueCalculated:Double?, tax:Double?, taxValue:Double?, shippingPolicy:String?, returnPolicy:String?, extraNotes:String?, completion: @escaping (CreateInvoiceCodable?, String?) -> Void)
    
    func listInvoices(customerMobile:String?, completion: @escaping ([InvoiceCodable]?, String?) -> Void)
    
    func getInvoice(invoiceNumber:String, completion: @escaping (InvoiceCodable?, String?) -> Void)
    func deleteInvoice(invoiceNumber:String, completion: @escaping (InvoiceDeleteCodable?, String?) -> Void)
    func payInvoice(invoiceNumber:String, customerMobile:String?, paymentMethodId:String?, completion: @escaping (InvoicePayCodable?, String?) -> Void)
}

public class Invoices: InvoicesProtocol {
    private let invoiceWorker: InvoicesWorkerProtocol = InvoicesWorker()
    
    public func createInvoice(invoiceNumber: String?, items: [Items], customerMobile: String, status: Int?, createDate: String?, dueDate: String, prefPaymentMethod: String?, shippingFees: Double?, discountValue: Double?, discountType: String?, discountValueCalculated: Double?, tax: Double?, taxValue: Double?, shippingPolicy: String?, returnPolicy: String?, extraNotes: String?, completion: @escaping (CreateInvoiceCodable?, String?) -> Void) {
        invoiceWorker.create(invoiceNumber: invoiceNumber, items: items, customerMobile: customerMobile, status: status, createDate: createDate, dueDate: dueDate, prefPaymentMethod: prefPaymentMethod, shippingFees: shippingFees, discountValue: discountValue, discountType: discountType, discountValueCalculated: discountValueCalculated, tax: tax, taxValue: taxValue, shippingPolicy: shippingPolicy, returnPolicy: returnPolicy, extraNotes: extraNotes) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func listInvoices(customerMobile: String?, completion: @escaping ([InvoiceCodable]?, String?) -> Void) {
        invoiceWorker.list(customerMobile: customerMobile) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func getInvoice(invoiceNumber: String, completion: @escaping (InvoiceCodable?, String?) -> Void) {
        invoiceWorker.get(invoiceNumber: invoiceNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func deleteInvoice(invoiceNumber: String, completion: @escaping (InvoiceDeleteCodable?, String?) -> Void) {
        invoiceWorker.delete(invoiceNumber: invoiceNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func payInvoice(invoiceNumber: String, customerMobile: String?, paymentMethodId: String?, completion: @escaping (InvoicePayCodable?, String?) -> Void) {
        invoiceWorker.pay(invoiceNumber: invoiceNumber, customerMobile: customerMobile, paymentMethodId: paymentMethodId) { resutls in
            switch resutls {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
