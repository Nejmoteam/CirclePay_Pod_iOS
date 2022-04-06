//
//  TransactionsWorker.swift
//  CirclePay
//
//  Created by apple on 09/01/2022.
//

import Foundation
protocol TransactionsWorkerProtocol {
    func getPayments(page: Int, limit: Int, minValue: Double?, maxValue: Double?, minDate: String?, maxDate: String?, paymentMethod: String?, status: String?, operationId: Int?, transactionId: Int?, coupon: String?, invoiceId: Int?, oid: Int?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<TransactionsPaymentData>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getRefunds(userId: Int, page: Int, limit: Int, minValue: Double?, maxValue: Double?, minDate: String?, maxDate: String?, paymentMethod: String?, status: String?, operationId: Int?, transactionId: Int?, coupon: String?, invoiceId: Int?, oid: Int?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<TransactionsRefundData>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getSingleRefund(transactionId: Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<TransactionRefundEntity>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getSinglePayment(transactionId: Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<TransactionPaymentEntity>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getPaymentsHeader(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<TotalPaymentsHeader>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getRefundssHeader(userId: Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[TotalRefundsHeader]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class TransactionsWorker: APIRequestExecuter<TransactionsNetworking>, TransactionsWorkerProtocol {
    func getPayments(page: Int, limit: Int, minValue: Double?, maxValue: Double?, minDate: String?, maxDate: String?, paymentMethod: String?, status: String?, operationId: Int?, transactionId: Int?, coupon: String?, invoiceId: Int?, oid: Int?, completion: @escaping (Result<BaseAPIRequestResponseModel<TransactionsPaymentData>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getPayments(page: page, limit: limit, minValue: minValue, maxValue: maxValue, minDate: minDate, maxDate: maxDate, paymentMethod: paymentMethod, status: status, operationId: operationId, transactionId: transactionId, coupon: coupon, invoiceId: invoiceId, oid: oid), responseClass: BaseAPIRequestResponseModel<TransactionsPaymentData>.self) { results in
            completion(results)
        }
    }

    func getRefunds(userId: Int, page: Int, limit: Int, minValue: Double?, maxValue: Double?, minDate: String?, maxDate: String?, paymentMethod: String?, status: String?, operationId: Int?, transactionId: Int?, coupon: String?, invoiceId: Int?, oid: Int?, completion: @escaping (Result<BaseAPIRequestResponseModel<TransactionsRefundData>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getRefunds(userId: userId, page: page, limit: limit, minValue: minValue, maxValue: maxValue, minDate: minDate, maxDate: maxDate, paymentMethod: paymentMethod, status: status, operationId: operationId, transactionId: transactionId, coupon: coupon, invoiceId: invoiceId, oid: oid), responseClass: BaseAPIRequestResponseModel<TransactionsRefundData>.self) { results in
            completion(results)
        }
    }

    func getSingleRefund(transactionId: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<TransactionRefundEntity>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getSingleRefund(transactionId: transactionId), responseClass: BaseAPIRequestResponseModel<TransactionRefundEntity>.self) { results in
            completion(results)
        }
    }

    func getSinglePayment(transactionId: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<TransactionPaymentEntity>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getSinglePayment(transactionId: transactionId), responseClass: BaseAPIRequestResponseModel<TransactionPaymentEntity>.self) { results in
            completion(results)
        }
    }

    func getPaymentsHeader(completion: @escaping (Result<BaseAPIRequestResponseModel<TotalPaymentsHeader>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getTotalPayments, responseClass: BaseAPIRequestResponseModel<TotalPaymentsHeader>.self) { results in
            completion(results)
        }
    }

    func getRefundssHeader(userId: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[TotalRefundsHeader]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getTotalRefunds(userId: userId), responseClass: BaseAPIRequestResponseModel<[TotalRefundsHeader]>.self) { results in
            completion(results)
        }
    }
}
