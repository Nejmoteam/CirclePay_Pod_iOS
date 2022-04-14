//
//  PaymentWorker.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation

protocol PaymentMethodWorkerProtocol {
    func list(paymentGatewayId:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentMethodCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func get(paymentMethodId:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentMethodCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class PaymentMethodWorker: APIRequestExecuter<PaymentMethodNetworking>, PaymentMethodWorkerProtocol {
    func list(paymentGatewayId: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentMethodCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .list(paymentGatewayId: paymentGatewayId), responseClass: BaseAPIRequestResponseModel<[PaymentMethodCodable]>.self) { results in
            completion(results)
        }
    }
    
    func get(paymentMethodId: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentMethodCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .get(paymentMethodId: paymentMethodId), responseClass: BaseAPIRequestResponseModel<[PaymentMethodCodable]>.self) { results in
            completion(results)
        }
    }
}
