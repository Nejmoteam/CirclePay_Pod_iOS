//
//  PaymentNetworking.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation
import Alamofire
enum PaymentGatewayNetworking {
    case list
    
    case get(paymentGatewayId:String)
}

extension PaymentGatewayNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .list:
            return "payment/gateway/list"
        case let .get(paymentGatewayId):
            return "payment/gateway/get/\(paymentGatewayId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        case .get:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .list:
            return .normalRequest
        case .get:
            return .normalRequest
        }
    }
}
