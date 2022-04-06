//
//  TransactionsNetworking.swift
//  CirclePay
//
//  Created by apple on 09/01/2022.
//

import Alamofire
import Foundation
enum TransactionsNetworking {
   
}

extension TransactionsNetworking: APIRequestBuilder {
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
