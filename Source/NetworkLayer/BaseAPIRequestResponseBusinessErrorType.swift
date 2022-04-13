//
//  BaseAPIRequestResponseBusinessErrorType.swift
//  CirclePay
//
//  Created Alchemist on 06/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation

enum BaseAPIRequestResponseBusinessErrorType: Error {
    case languageIsMissing

    var message: String {
        switch self {
        case .languageIsMissing: return "Preferred Language is missing!"
        }
    }
}
