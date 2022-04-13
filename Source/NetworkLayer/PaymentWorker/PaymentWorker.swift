//
//  PaymentWorker.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation

protocol PaymentWorkerProtocol {
    func list(couponCode:String?, customerMobile:String?, invoiceNum:String?, paymentLinkUrl:String?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func get(transactionId:Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class PaymentWorker: APIRequestExecuter<PaymentNetworking>, PaymentWorkerProtocol {
    func list(couponCode: String?, customerMobile: String?, invoiceNum: String?, paymentLinkUrl: String?, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .list(couponCode: couponCode, customerMobile: customerMobile, invoiceNum: invoiceNum, paymentLinkUrl: paymentLinkUrl), responseClass: BaseAPIRequestResponseModel<[PaymentCodable]>.self) { results in
            completion(results)
        }
    }
    
    func get(transactionId: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .get(transactionId: transactionId), responseClass: BaseAPIRequestResponseModel<[PaymentCodable]>.self) { results in
            completion(results)
        }
    }
}
