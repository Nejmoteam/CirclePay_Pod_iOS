//
//  Payments.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation
public protocol PaymentMethodsProtocol {
    func getAllPaymentMethods(paymentGatewayId:String, completion: @escaping ([PaymentMethodCodable]?, String?) -> Void)
    
    func getPaymentMethod(paymentMethodId:String, completion: @escaping (PaymentMethodCodable?, String?) -> Void)
}
public class PaymentMethods:PaymentMethodsProtocol {
    private let paymentMethodWorker: PaymentMethodWorkerProtocol = PaymentMethodWorker()
    
    public func getAllPaymentMethods(paymentGatewayId: String, completion: @escaping ([PaymentMethodCodable]?, String?) -> Void) {
        paymentMethodWorker.list(paymentGatewayId: paymentGatewayId) { results in
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
    
    public func getPaymentMethod(paymentMethodId: String, completion: @escaping (PaymentMethodCodable?, String?) -> Void) {
        paymentMethodWorker.get(paymentMethodId: paymentMethodId) { results in
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
