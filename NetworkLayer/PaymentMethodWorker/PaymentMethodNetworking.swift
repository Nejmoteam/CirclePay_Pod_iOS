//
//  PaymentNetworking.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation
import Alamofire
enum PaymentMethodNetworking {
    case list(paymentGatewayId:String)
    case get(paymentMethodId:String)
}

extension PaymentMethodNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case let .list(paymentGatewayId):
            return "payment/methods/list/\(paymentGatewayId)"
        case let .get(paymentMethodId):
            return "payment/methods/get/\(paymentMethodId)"
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
