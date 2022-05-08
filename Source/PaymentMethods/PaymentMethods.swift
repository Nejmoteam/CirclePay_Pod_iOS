//
//  Payments.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation
public protocol PaymentMethodsProtocol {
    func getAllPaymentMethods(paymentGatewayId:String, completion: @escaping ([PaymentMethodCodable]?, CirclePayError?) -> Void)
    
    func getPaymentMethod(paymentMethodId:String, completion: @escaping (PaymentMethodCodable?, CirclePayError?) -> Void)
}
public class PaymentMethods:PaymentMethodsProtocol {
    private let paymentMethodWorker: PaymentMethodWorkerProtocol = PaymentMethodWorker()
    
    public func getAllPaymentMethods(paymentGatewayId: String, completion: @escaping ([PaymentMethodCodable]?, CirclePayError?) -> Void) {
        paymentMethodWorker.list(paymentGatewayId: paymentGatewayId) { results in
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
    
    public func getPaymentMethod(paymentMethodId: String, completion: @escaping (PaymentMethodCodable?, CirclePayError?) -> Void) {
        paymentMethodWorker.get(paymentMethodId: paymentMethodId) { results in
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
