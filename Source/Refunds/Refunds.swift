//
//  Payments.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation

public protocol RefundsProtocol {
    func getAllRefunds(completion: @escaping ([RefundCodable]?, CirclePayError?) -> Void)
    
    func getRefuntStatus(refundId:Int, completion: @escaping (RefundCodable?, CirclePayError?) -> Void)
    
    func requestRefund(transactionId:Int, completion: @escaping (RequestRefundCodable?, CirclePayError?) -> Void)
}
public class Refunds:RefundsProtocol {
    private let refundWorker: RefundWorkerProtocol = RefundWorker()
    

    
    public func getAllRefunds(completion: @escaping ([RefundCodable]?, CirclePayError?) -> Void) {
        refundWorker.list { results in
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
    
    public func getRefuntStatus(refundId: Int, completion: @escaping (RefundCodable?, CirclePayError?) -> Void) {
        refundWorker.get(refundId: refundId) { results in
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
    
    public func requestRefund(transactionId: Int, completion: @escaping (RequestRefundCodable?, CirclePayError?) -> Void) {
        refundWorker.requestRefund(transactionId: transactionId) { results in
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
