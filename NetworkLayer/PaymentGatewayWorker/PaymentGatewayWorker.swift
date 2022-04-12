//
//  PaymentWorker.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation

protocol PaymentGatewayWorkerProtocol {
    func list(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentGatewayCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func get(paymentGatewayId:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentGatewayCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class PaymentGatewayWorker: APIRequestExecuter<PaymentGatewayNetworking>, PaymentGatewayWorkerProtocol {
    func list(completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentGatewayCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .list, responseClass: BaseAPIRequestResponseModel<[PaymentGatewayCodable]>.self) { results in
            completion(results)
        }
    }
    
    func get(paymentGatewayId: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentGatewayCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .get(paymentGatewayId: paymentGatewayId), responseClass: BaseAPIRequestResponseModel<[PaymentGatewayCodable]>.self) { results in
            completion(results)
        }
    }
}
