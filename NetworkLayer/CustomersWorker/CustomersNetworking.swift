//
//  CustomersNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 10/01/2022.
//

import Alamofire
import Foundation
enum CustomersNetworking {
   
}

extension CustomersNetworking: APIRequestBuilder {
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
