//
//  Payments.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation
public protocol RefundsProtocol {
    func getAllRefunds(completion: @escaping ([RefundCodable]?, String?) -> Void)
    
    func getRefuntStatus(refundId:Int, completion: @escaping (RefundCodable?, String?) -> Void)
    
    func requestRefund(transactionId:Int, completion: @escaping (RequestRefundCodable?, String?) -> Void)
}
public class Refunds:RefundsProtocol {
    private let refundWorker: RefundWorkerProtocol = RefundWorker()
    
    public func getAllRefunds(completion: @escaping ([RefundCodable]?, String?) -> Void) {
        refundWorker.list { results in
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
    
    public func getRefuntStatus(refundId: Int, completion: @escaping (RefundCodable?, String?) -> Void) {
        refundWorker.get(refundId: refundId) { results in
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
    
    public func requestRefund(transactionId: Int, completion: @escaping (RequestRefundCodable?, String?) -> Void) {
        refundWorker.requestRefund(transactionId: transactionId) { results in
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
