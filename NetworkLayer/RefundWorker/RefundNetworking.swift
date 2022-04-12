//
//  PaymentNetworking.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation
import Alamofire
enum RefundNetworking {
    case list
    case get(refundId:Int)
    case requestRefund(transactionId:Int)
}

extension RefundNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .list:
            return "refund/list"
        case let .get(refundId):
            return "refund/get/\(refundId)"
        case .requestRefund:
            return "refund/request"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .post
        case .get:
            return .get
        case .requestRefund:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .list:
            return .normalRequest
        case .get:
            return .normalRequest
        case let .requestRefund(transactionId):
            let params = ["transaction_id":transactionId]
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
        }
    }
}
