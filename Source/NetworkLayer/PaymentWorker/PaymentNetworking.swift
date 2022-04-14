//
//  PaymentNetworking.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation
import Alamofire
enum PaymentNetworking {
    case list(couponCode:String?, customerMobile:String?, invoiceNum:String?, paymentLinkUrl:String?)
    
    case get(transactionId:Int)
}

extension PaymentNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .list:
            return "payment/list"
        case let .get(transactionId):
            return "payment/get/\(transactionId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .post
        case .get:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .list(couponCode, customerMobile, invoiceNum, paymentLinkUrl):
            var params = [String:String]()
            if let unwrappedCouponCode = couponCode {
                params["coupon_code"] = unwrappedCouponCode
            }
            if let unwrappedCustomerMobile = customerMobile {
                params["customer_mobile"] = unwrappedCustomerMobile
            }
            if let unwrappedInvoiceNum = invoiceNum {
                params["invoice_num"] = unwrappedInvoiceNum
            }
            if let unwrappedPaymentLinkUrl = paymentLinkUrl {
                params["payment_link_url"] = unwrappedPaymentLinkUrl
            }
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
        case .get:
            return .normalRequest
        }
    }
}
