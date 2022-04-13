//
//  PaymentWorker.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation

protocol RefundWorkerProtocol {
    func list(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[RefundCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func get(refundId:Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[RefundCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func requestRefund(transactionId:Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[RequestRefundCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class RefundWorker: APIRequestExecuter<RefundNetworking>, RefundWorkerProtocol {
    
    func list(completion: @escaping (Result<BaseAPIRequestResponseModel<[RefundCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .list, responseClass: BaseAPIRequestResponseModel<[RefundCodable]>.self) { results in
            completion(results)
        }
    }
    
    func get(refundId: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[RefundCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .get(refundId: refundId), responseClass: BaseAPIRequestResponseModel<[RefundCodable]>.self) { results in
            completion(results)
        }
    }
    
    func requestRefund(transactionId: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[RequestRefundCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .requestRefund(transactionId: transactionId), responseClass: BaseAPIRequestResponseModel<[RequestRefundCodable]>.self) { results in
            completion(results)
        }
    }
}
