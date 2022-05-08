//
//  Payments.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//
import Foundation
public protocol PaymentGatewaysProtocol {
    func getAllPaymentGetways(completion: @escaping ([PaymentGatewayCodable]?, CirclePayError?) -> Void)
    
    func getPaymentGetway(paymentGatewayId:String, completion: @escaping (PaymentGatewayCodable?, CirclePayError?) -> Void)
}
public class PaymentGateways:PaymentGatewaysProtocol {
    private let paymentGatewayWorker: PaymentGatewayWorkerProtocol = PaymentGatewayWorker()
    
    
    public func getAllPaymentGetways(completion: @escaping ([PaymentGatewayCodable]?, CirclePayError?) -> Void) {
        paymentGatewayWorker.list { results in
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
    
    public func getPaymentGetway(paymentGatewayId: String, completion: @escaping (PaymentGatewayCodable?, CirclePayError?) -> Void) {
        paymentGatewayWorker.get(paymentGatewayId: paymentGatewayId) { results in
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
