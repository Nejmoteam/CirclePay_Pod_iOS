//
//  CustomersNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 10/01/2022.
//

import Alamofire
import Foundation
enum CustomersNetworking {
    case create(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String)
    case update(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String)
    case get(mobileNumber:String)
    case list
}

extension CustomersNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .create:
            return "customer/create"
        case .update:
            return "customer/update"
        case let .get(mobileNumber):
            return "customer/get/\(mobileNumber)"
        case .list:
            return "customer/list"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .create:
            return .post
        case .update:
            return .put
        case .get:
            return .get
        case .list:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .create(firstName, lastName, address, country, governorate, city, aptNumber, email, mobileNumber):
            let params = ["first_name": firstName, "last_name": lastName, "address": address, "country": country, "governorate": governorate, "city": city, "apt_num": aptNumber, "email": email, "mobile_number": mobileNumber]
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
        case let .update(firstName, lastName, address, country, governorate, city, aptNumber, email, mobileNumber):
            let params = ["first_name": firstName, "last_name": lastName, "address": address, "country": country, "governorate": governorate, "city": city, "apt_num": aptNumber, "email": email, "mobile_number": mobileNumber]
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
        case .get:
            return .normalRequest
        case .list:
            return .normalRequest
            
        }
    }
}
