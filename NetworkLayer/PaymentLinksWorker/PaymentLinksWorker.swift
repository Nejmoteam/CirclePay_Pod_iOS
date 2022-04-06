//
//  PaymentLinksWorker.swift
//  CirclePay
//
//  Created by Alchemist on 03/01/2022.
//
import Foundation
protocol PaymentLinksWorkerProtocol {
    func getPaymentLinks(page: Int, limit: Int, coupon: String?, cFlag: Bool?, label: String?, lFlag: Bool?, minValue: String?, maxValue: String?, vFlag: Bool?, minTrans: String?, maxTrans: String?, tFlag: Bool?, minRevenue: String?, maxRevenue: String?, rFlag: Bool?, cDateFlag: Bool?, cStartDate: String?, cEndDate: String?, eDateFlag: Bool?, eStartDate: String?, eEndDate: String?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<PaymentLinksData>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    func getPaymentLinksDetails(id: String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<PaymentLinksDataValues>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getPaymentLinkCustomers(id: String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[CustomersDataValues]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getPaymentLinkRefunds(id: String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[TransactionRefundEntity]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getPaymentLinkCuppons(id: String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[Cuppons]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    func getTotalCollected(date: String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentLinksTotalCollected]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getAvgDailyRevenue(date: String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<PaymentLinksAvgDailyRevenue>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class PaymentLinksWorker: APIRequestExecuter<PaymentLinksNetworking>, PaymentLinksWorkerProtocol {
    func getPaymentLinkCuppons(id: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[Cuppons]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getPaymentLinksCuppons(id: id), responseClass: BaseAPIRequestResponseModel<[Cuppons]>.self) { result in
            completion(result)
        }
    }

    func getPaymentLinkRefunds(id: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[TransactionRefundEntity]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getPaymentLinksRefunds(id: id), responseClass: BaseAPIRequestResponseModel<[TransactionRefundEntity]>.self) { result in
            completion(result)
        }
    }

    func getPaymentLinkCustomers(id: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[CustomersDataValues]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getPaymentLinksCustomers(id: id), responseClass: BaseAPIRequestResponseModel<[CustomersDataValues]>.self) { result in
            completion(result)
        }
    }

    func getPaymentLinksDetails(id: String, completion: @escaping (Result<BaseAPIRequestResponseModel<PaymentLinksDataValues>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getPaymentLinkDetails(id: id), responseClass: BaseAPIRequestResponseModel<PaymentLinksDataValues>.self) { result in
            completion(result)
        }
    }

    func getPaymentLinks(page: Int, limit: Int, coupon: String?, cFlag: Bool?, label: String?, lFlag: Bool?, minValue: String?, maxValue: String?, vFlag: Bool?, minTrans: String?, maxTrans: String?, tFlag: Bool?, minRevenue: String?, maxRevenue: String?, rFlag: Bool?, cDateFlag: Bool?, cStartDate: String?, cEndDate: String?, eDateFlag: Bool?, eStartDate: String?, eEndDate: String?, completion: @escaping (Result<BaseAPIRequestResponseModel<PaymentLinksData>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getPaymentLinks(page: page, limit: limit, coupon: coupon, cFlag: cFlag, label: label, lFlag: lFlag, minValue: minValue, maxValue: maxValue, vFlag: vFlag, minTrans: minTrans, maxTrans: maxTrans, tFlag: tFlag, minRevenue: minRevenue, maxRevenue: maxRevenue, rFlag: rFlag, cDateFlag: cDateFlag, cStartDate: cStartDate, cEndDate: cEndDate, eDateFlag: eDateFlag, eStartDate: eStartDate, eEndDate: eEndDate), responseClass: BaseAPIRequestResponseModel<PaymentLinksData>.self) { results in
            completion(results)
        }
    }

    func getTotalCollected(date: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentLinksTotalCollected]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getTotalCollected(date: date), responseClass: BaseAPIRequestResponseModel<[PaymentLinksTotalCollected]>.self) { results in
            completion(results)
        }
    }

    func getAvgDailyRevenue(date: String, completion: @escaping (Result<BaseAPIRequestResponseModel<PaymentLinksAvgDailyRevenue>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getAvgDailyRevenue(date: date), responseClass: BaseAPIRequestResponseModel<PaymentLinksAvgDailyRevenue>.self) { results in
            completion(results)
        }
    }
}
