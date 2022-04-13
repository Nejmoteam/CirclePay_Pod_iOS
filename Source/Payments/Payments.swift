//
//  Payments.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation
public protocol PaymentsProtocol {
    func list(couponCode:String?, customerMobile:String?, invoiceNum:String?, paymentLinkUrl:String?, completion: @escaping ([PaymentCodable]?, String?) -> Void)
    
    func get(transactionId:Int, completion: @escaping (PaymentCodable?, String?) -> Void)
}
public class Payments:PaymentsProtocol {
    private let paymentWorker: PaymentWorkerProtocol = PaymentWorker()
    
    public func list(couponCode: String?, customerMobile: String?, invoiceNum: String?, paymentLinkUrl: String?, completion: @escaping ([PaymentCodable]?, String?) -> Void) {
        paymentWorker.list(couponCode: couponCode, customerMobile: customerMobile, invoiceNum: invoiceNum, paymentLinkUrl: paymentLinkUrl) { results in
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
    
    public func get(transactionId: Int, completion: @escaping (PaymentCodable?, String?) -> Void) {
        paymentWorker.get(transactionId: transactionId) { results in
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
}
