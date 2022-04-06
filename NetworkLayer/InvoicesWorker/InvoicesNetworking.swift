//
//  InvoicesNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 25/12/2021.
//

import Alamofire
import Foundation
enum InvoicesNetworking {
    
}

extension InvoicesNetworking: APIRequestBuilder {
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
