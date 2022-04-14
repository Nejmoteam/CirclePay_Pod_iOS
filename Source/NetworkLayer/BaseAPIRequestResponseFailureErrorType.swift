//
//  BaseAPIRequestResponseFailureErrorType.swift
//  CirclePay
//
//  Created Alchemist on 06/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation

public enum BaseAPIRequestResponseFailureErrorType: Error {
    case informational
    case redirection
    case client
    case server
    case internet

    // Without Status Code
    case unknown
    case parse

    var message: String {
        switch self {
        case .informational:
            return ""
        case .redirection:
            return ""
        case .client:
            return ""
        case .server:
            return ""
        case .unknown:
            return ""
        case .internet:
            return ""
        case .parse:
            return ""
        }
    }
}
