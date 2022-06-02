//
//  ConfigurationNetworking.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 31/05/2022.
//

import Alamofire
import Foundation
enum ConfigurationNetworking {
    case getConfiguration(merchantToken:String, type: String)
}

extension ConfigurationNetworking: APIRequestBuilder {
    var baseUrl: String {
        return "https://mocki.io/v1/5f0efbaf-0758-4bf0-9d14-82e3ca228b77"
    }
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
