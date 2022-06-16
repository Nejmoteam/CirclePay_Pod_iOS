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


enum SDKInternalErrorType: Error {
    case failedToPay
    case other
    case failedToGetInvoices
    case failedToGetMerchant
    case failedToGetConfigs
    case failedToGetCustomers
    case failedToGetPaymentMethods
    case invoiceWasExpired
    case invoiceWasPaid
    
    var message: String {
        switch self {
        case .failedToPay: return "Something went wrong during payment process, please try again"
        case .other: return "Something went wrong during payment process"
        case .failedToGetInvoices: return "Something went wrong during getting Invoice data"
        case .failedToGetMerchant: return "Something went wrong during getting merchant data"
        case .failedToGetConfigs: return "Something went wrong during getting configs data"
        case .failedToGetPaymentMethods: return "Something went wrong during getting paymenyMethds data"
        case .failedToGetCustomers: return "Something went wrong during getting customer data"
        case .invoiceWasExpired: return "Invoice was Expired"
        case .invoiceWasPaid: return "Invoice was PAID"
        }
    }
    
    var code: Int {
        switch self {
        case .failedToPay: return 200001
        case .other: return -111111
        case .failedToGetInvoices: return -111112
        case .failedToGetMerchant: return -111113
        case .failedToGetConfigs: return -111114
        case .failedToGetCustomers: return -111115
        case .failedToGetPaymentMethods: return -111116
        case .invoiceWasExpired: return -111117
        case .invoiceWasPaid: return -111118
        }
    }
}

extension Int {
    func getSDKInternalError() -> SDKInternalErrorType {
        switch self {
        case 20011:
            return .failedToPay
        default:
            return .other
        }
    }
}

