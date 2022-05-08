//
//  Invoices.swift
//  Alamofire
//
//  Created by apple on 08/04/2022.
//

import Foundation
public protocol InvoicesProtocol {
    func createInvoice(invoiceNumber:String?,items: [Items], customerMobile:String, status:Int?, createDate:String?, dueDate:String, prefPaymentMethod:String?, shippingFees:Double?, discountValue:Double?, discountType:String?, discountValueCalculated:Double?, tax:Double?, taxValue:Double?, shippingPolicy:String?, returnPolicy:String?, extraNotes:String?, completion: @escaping (CreateInvoiceCodable?, CirclePayError?) -> Void)
    func createInvoice(items: [Items], customerMobile:String, dueDate:String, completion: @escaping (CreateInvoiceCodable?, CirclePayError?) -> Void)
    
    
    func listInvoices(customerMobile:String?, completion: @escaping ([InvoiceCodable]?, CirclePayError?) -> Void)
    
    func getInvoice(invoiceNumber:String, completion: @escaping (InvoiceCodable?, CirclePayError?) -> Void)
    func deleteInvoice(invoiceNumber:String, completion: @escaping (InvoiceDeleteCodable?, CirclePayError?) -> Void)
    func payInvoice(invoiceNumber:String, customerMobile:String?, paymentMethodId:String?, completion: @escaping (InvoicePayCodable?, CirclePayError?) -> Void)
}

public class Invoices: InvoicesProtocol {
    private let invoiceWorker: InvoicesWorkerProtocol = InvoicesWorker()
    
    public func createInvoice(invoiceNumber: String? = "", items: [Items], customerMobile: String, status: Int?, createDate: String?, dueDate: String, prefPaymentMethod: String?, shippingFees: Double?, discountValue: Double?, discountType: String?, discountValueCalculated: Double?, tax: Double?, taxValue: Double?, shippingPolicy: String?, returnPolicy: String?, extraNotes: String?, completion: @escaping (CreateInvoiceCodable?, CirclePayError?) -> Void) {
        invoiceWorker.create(invoiceNumber: invoiceNumber, items: items, customerMobile: customerMobile, status: status, createDate: createDate, dueDate: dueDate, prefPaymentMethod: prefPaymentMethod, shippingFees: shippingFees, discountValue: discountValue, discountType: discountType, discountValueCalculated: discountValueCalculated, tax: tax, taxValue: taxValue, shippingPolicy: shippingPolicy, returnPolicy: returnPolicy, extraNotes: extraNotes) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    
    public func createInvoice(items: [Items], customerMobile: String, dueDate: String, completion: @escaping (CreateInvoiceCodable?, CirclePayError?) -> Void) {
        invoiceWorker.create(invoiceNumber: nil, items: items, customerMobile: customerMobile, status: nil, createDate: nil, dueDate: dueDate, prefPaymentMethod: nil, shippingFees: nil, discountValue: nil, discountType: nil, discountValueCalculated: nil, tax: nil, taxValue: nil, shippingPolicy: nil, returnPolicy: nil, extraNotes: nil) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    public func listInvoices(customerMobile: String?, completion: @escaping ([InvoiceCodable]?, CirclePayError?) -> Void) {
        invoiceWorker.list(customerMobile: customerMobile) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func getInvoice(invoiceNumber: String, completion: @escaping (InvoiceCodable?, CirclePayError?) -> Void) {
        invoiceWorker.get(invoiceNumber: invoiceNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func deleteInvoice(invoiceNumber: String, completion: @escaping (InvoiceDeleteCodable?, CirclePayError?) -> Void) {
        invoiceWorker.delete(invoiceNumber: invoiceNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func payInvoice(invoiceNumber: String, customerMobile: String?, paymentMethodId: String?, completion: @escaping (InvoicePayCodable?, CirclePayError?) -> Void) {
        invoiceWorker.pay(invoiceNumber: invoiceNumber, customerMobile: customerMobile, paymentMethodId: paymentMethodId) { resutls in
            switch resutls {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
}
