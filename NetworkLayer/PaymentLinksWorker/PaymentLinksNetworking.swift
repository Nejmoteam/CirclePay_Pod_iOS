//
//  PaymentLinksNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 03/01/2022.
//
import Alamofire
import Foundation
enum PaymentLinksNetworking {
   
}

extension PaymentLinksNetworking: APIRequestBuilder {
    var path: String {
       return ""
    }

    var method: HTTPMethod {
        return .get
    }

    var task: Task {
        return .normalRequest
    }
}
