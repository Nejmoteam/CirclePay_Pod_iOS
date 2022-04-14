//
//  Payments.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation
public protocol PaymentGatewaysProtocol {
    func list(completion: @escaping ([PaymentGatewayCodable]?, String?) -> Void)
    
    func get(paymentGatewayId:String, completion: @escaping (PaymentGatewayCodable?, String?) -> Void)
}
public class PaymentGateways:PaymentGatewaysProtocol {
    private let paymentGatewayWorker: PaymentGatewayWorkerProtocol = PaymentGatewayWorker()
    
    
    public func list(completion: @escaping ([PaymentGatewayCodable]?, String?) -> Void) {
        paymentGatewayWorker.list { results in
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
    
    public func get(paymentGatewayId: String, completion: @escaping (PaymentGatewayCodable?, String?) -> Void) {
        paymentGatewayWorker.get(paymentGatewayId: paymentGatewayId) { results in
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
