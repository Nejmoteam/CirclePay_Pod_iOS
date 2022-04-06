//
//  Int+BusinessErrorCode.swift
//  CirclePay
//
//  Created Alchemist on 06/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
extension Int {
    func getAPIRequestResponseBusinessError() -> BaseAPIRequestResponseBusinessErrorType {
        switch self {
        case 20011:
            return .languageIsMissing
        default:
            return .languageIsMissing
        }
    }
}
