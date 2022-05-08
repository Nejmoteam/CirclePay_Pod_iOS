//
//  Payments.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation
public protocol PaymentsProtocol {
    func getAllPayments(couponCode:String?, customerMobile:String?, invoiceNum:String?, paymentLinkUrl:String?, completion: @escaping ([PaymentCodable]?, CirclePayError?) -> Void)
    
    func getPayment(transactionId:Int, completion: @escaping (PaymentCodable?, CirclePayError?) -> Void)
}
public class Payments:PaymentsProtocol {
    private let paymentWorker: PaymentWorkerProtocol = PaymentWorker()

    public func getAllPayments(couponCode: String?, customerMobile: String?, invoiceNum: String?, paymentLinkUrl: String?, completion: @escaping ([PaymentCodable]?, CirclePayError?) -> Void) {
        paymentWorker.list(couponCode: couponCode, customerMobile: customerMobile, invoiceNum: invoiceNum, paymentLinkUrl: paymentLinkUrl) { results in
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
    
    public func getPayment(transactionId: Int, completion: @escaping (PaymentCodable?, CirclePayError?) -> Void) {
        paymentWorker.get(transactionId: transactionId) { results in
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
}
