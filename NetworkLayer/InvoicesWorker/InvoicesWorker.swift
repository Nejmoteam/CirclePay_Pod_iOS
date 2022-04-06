//
//  InvoicesWorker.swift
//  CirclePay
//
//  Created by Alchemist on 25/12/2021.
//

import Foundation
protocol InvoicesWorkerProtocol {
    func getInvoices(page: Int, limit: Int, cStart: String?, cEnd: String?, dStart: String?, dEnd: String?, cName: String?, number: String?, value: String?, value2: String?, method: String?, tid: String?, oid: String?, status: String?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<InvoicesData>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getInvoicesDetails(invoiceId: String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<InvoiceDetails>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getInvoicesTotalCollected(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<InovicesTotal>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    func getInvoicesTotalOverdue(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<InovicesTotal>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class InvoicesWorker: APIRequestExecuter<InvoicesNetworking>, InvoicesWorkerProtocol {
    func getInvoices(page: Int, limit: Int, cStart: String?, cEnd: String?, dStart: String?, dEnd: String?, cName: String?, number: String?, value: String?, value2: String?, method: String?, tid: String?, oid: String?, status: String?, completion: @escaping (Result<BaseAPIRequestResponseModel<InvoicesData>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getInvoices(page: page, limit: limit, cStart: cStart, cEnd: cEnd, dStart: dStart, dEnd: dEnd, cName: cName, number: number, value: value, value2: value2, method: method, tid: tid, oid: oid, status: status), responseClass: BaseAPIRequestResponseModel<InvoicesData>.self) { results in
            completion(results)
        }
    }

    func getInvoicesDetails(invoiceId: String, completion: @escaping (Result<BaseAPIRequestResponseModel<InvoiceDetails>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getInvoicesDetails(invoiceId: invoiceId), responseClass: BaseAPIRequestResponseModel<InvoiceDetails>.self) { result in
            completion(result)
        }
    }

    func getInvoicesTotalCollected(completion: @escaping (Result<BaseAPIRequestResponseModel<InovicesTotal>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getInvoicesTotalCollected, responseClass: BaseAPIRequestResponseModel<InovicesTotal>.self) { results in
            completion(results)
        }
    }

    func getInvoicesTotalOverdue(completion: @escaping (Result<BaseAPIRequestResponseModel<InovicesTotal>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getInvoicesTotalOverdue, responseClass: BaseAPIRequestResponseModel<InovicesTotal>.self) { results in
            completion(results)
        }
    }
}
