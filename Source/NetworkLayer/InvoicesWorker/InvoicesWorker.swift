//
//  InvoicesWorker.swift
//  CirclePay
//
//  Created by Alchemist on 25/12/2021.
//

import Foundation
protocol InvoicesWorkerProtocol {
   func create(invoiceNumber:String?,items: [Items], customerMobile:String, status:Int?, createDate:String?, dueDate:String, prefPaymentMethod:String?, shippingFees:Double?, discountValue:Double?, discountType:String?, tax:Double?, taxValue:Double?, shippingPolicy:String?, returnPolicy:String?, extraNotes:String?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[CreateInvoiceCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func list(customerMobile:String?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[InvoiceCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    func get(invoiceNumber:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[InvoiceCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    func delete(invoiceNumber:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[InvoiceDeleteCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    func pay(invoiceNumber:String, customerMobile:String?, paymentMethodId:String?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[InvoicePayCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class InvoicesWorker: APIRequestExecuter<InvoicesNetworking>, InvoicesWorkerProtocol {
    func create(invoiceNumber: String?, items: [Items], customerMobile: String, status: Int?, createDate: String?, dueDate: String, prefPaymentMethod: String?, shippingFees: Double?, discountValue: Double?, discountType: String?, tax: Double?, taxValue: Double?, shippingPolicy: String?, returnPolicy: String?, extraNotes: String?, completion:  @escaping (Result<BaseAPIRequestResponseModel<[CreateInvoiceCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .create(invoiceNumber: invoiceNumber, items: items, customerMobile: customerMobile, status: status, createDate: createDate, dueDate: dueDate, prefPaymentMethod: prefPaymentMethod, shippingFees: shippingFees, discountValue: discountValue, discountType: discountType, tax: tax, taxValue: taxValue, shippingPolicy: shippingPolicy, returnPolicy: returnPolicy, extraNotes: extraNotes), responseClass: BaseAPIRequestResponseModel<[CreateInvoiceCodable]>.self) { results in
            completion(results)
        }
    }
    
    func list(customerMobile: String?, completion: @escaping (Result<BaseAPIRequestResponseModel<[InvoiceCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .list(customerMobile: customerMobile), responseClass: BaseAPIRequestResponseModel<[InvoiceCodable]>.self) { results in
            completion(results)
        }
    }
    
    func get(invoiceNumber: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[InvoiceCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .get(invoiceNumber: invoiceNumber), responseClass: BaseAPIRequestResponseModel<[InvoiceCodable]>.self) { results in
            completion(results)
        }
    }
    
    func delete(invoiceNumber: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[InvoiceDeleteCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .delete(invoiceNumber: invoiceNumber), responseClass: BaseAPIRequestResponseModel<[InvoiceDeleteCodable]>.self) { results in
            completion(results)
        }
    }
    
    func pay(invoiceNumber: String, customerMobile: String?, paymentMethodId: String?, completion: @escaping (Result<BaseAPIRequestResponseModel<[InvoicePayCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .pay(invoiceNumber: invoiceNumber, customerMobile: customerMobile, paymentMethodId: paymentMethodId), responseClass: BaseAPIRequestResponseModel<[InvoicePayCodable]>.self) { results in
            completion(results)
        }
    }
}
