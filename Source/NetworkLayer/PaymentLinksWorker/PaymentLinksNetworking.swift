//
//  PaymentNetworking.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation
import Alamofire
enum PaymentLinksNetworking {
    case getAllPaymentLinks(customerMobile:String?)
    case getPaymentLink(paymentLinkURL:String)
    case deactivatePaymentLink(paymentLinkURL:String)
    case createPaymentLink(name:String, description:String, value:Double, expiryDate:String, comments:String?, currency:String?,enableSurvey:Bool?, getCustAddress:Bool?,refundPolicyDetails:String?, refundPolicyFlag:Bool?,shippingPolicyDetails:String?, shippingPolicyFlag:Bool?, status:Bool?)
    case updatePaymentLink(link:String, name:String?, description:String?, value:Double?, expiryDate:String?, comments:String?, currency:String?,enableSurvey:Bool?, getCustAddress:Bool?,refundPolicyDetails:String?, refundPolicyFlag:Bool?,shippingPolicyDetails:String?, shippingPolicyFlag:Bool?, status:Bool?)
    
    case executePayment(couponCode:String?, customer:PaymentLinkCustomer?, formResponse:PaymentLinkFormResponse? , paymentGatewayName:String?, paymentMethodName:String?, paymentLinkUrl:String)
}

extension PaymentLinksNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case let .getAllPaymentLinks(customerMobile):
            if let unwrappedCustomerMobile = customerMobile {
                return "payment/link/list/\(unwrappedCustomerMobile)"
            } else {
                return "payment/link/list"
            }
        case let .getPaymentLink(paymentLinkURL):
            return "payment/link/get/\(paymentLinkURL)"
        case let .deactivatePaymentLink(paymentLinkURL):
            return "payment/link/deactivate/\(paymentLinkURL)"
        case .createPaymentLink:
            return "payment/link/create"
        case .updatePaymentLink:
            return "payment/link/update"
        case .executePayment:
            return "payment/link/pay"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllPaymentLinks:
            return .get
        case .getPaymentLink:
            return .get
        case .deactivatePaymentLink:
            return .delete
        case .createPaymentLink:
            return .post
        case .updatePaymentLink:
            return .put
        case .executePayment:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getAllPaymentLinks:
            return .normalRequest
        case .getPaymentLink:
            return .normalRequest
        case .deactivatePaymentLink:
            return .normalRequest
        case let .createPaymentLink(name, description, value, expiryDate, comments, currency, enableSurvey, getCustAddress, refundPolicyDetails, refundPolicyFlag, shippingPolicyDetails, shippingPolicyFlag, status):
            var params = ["name":name, "description":description, "value":value, "expiry_date":expiryDate] as [String : Any]
            
            if let unwrappedComments = comments {
                params["comments"] = unwrappedComments
            }
            
            if let unwrappedCurrency = currency {
                params["currency"] = unwrappedCurrency
            }
            
            if let unwrappedEnableSurvey = enableSurvey {
                params["enable_Survey"] = unwrappedEnableSurvey
            }
            
            if let unwrappedGetCustAddress = getCustAddress {
                params["get_cust_address"] = unwrappedGetCustAddress
            }
            
            if let unwrappedRefundPolicyDetails = refundPolicyDetails {
                params["refund_policy_details"] = unwrappedRefundPolicyDetails
            }
            
            if let unwrappedRefundPolicyFlag = refundPolicyFlag {
                params["refund_policy_flag"] = unwrappedRefundPolicyFlag
            }
            
            if let unwrappedShippingPolicyDetails = shippingPolicyDetails {
                params["shipping_policy_details"] = unwrappedShippingPolicyDetails
            }
            
            if let unwrappedShippingPolicyFlag = shippingPolicyFlag {
                params["shipping_policy_flag"] = unwrappedShippingPolicyFlag
            }
            
            if let unwrappedStatus = status {
                params["status"] = unwrappedStatus
            }
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
        case let .updatePaymentLink(link, name, description, value, expiryDate, comments, currency, enableSurvey, getCustAddress, refundPolicyDetails, refundPolicyFlag, shippingPolicyDetails, shippingPolicyFlag, status):
            var params = ["link":link] as [String : Any]
            
            if let unwrappedName = name {
                params["name"] = unwrappedName
            }
            
            if let unwrappedDescription = description {
                params["description"] = unwrappedDescription
            }
            
            if let unwrappedValue = value {
                params["value"] = unwrappedValue
            }
            
            if let unwrappedExpiryDate = expiryDate {
                params["expiry_date"] = unwrappedExpiryDate
            }
            
            if let unwrappedComments = comments {
                params["comments"] = unwrappedComments
            }
            
            if let unwrappedCurrency = currency {
                params["currency"] = unwrappedCurrency
            }
            
            if let unwrappedEnableSurvey = enableSurvey {
                params["enable_Survey"] = unwrappedEnableSurvey
            }
            
            if let unwrappedGetCustAddress = getCustAddress {
                params["get_cust_address"] = unwrappedGetCustAddress
            }
            
            if let unwrappedRefundPolicyDetails = refundPolicyDetails {
                params["refund_policy_details"] = unwrappedRefundPolicyDetails
            }
            
            if let unwrappedRefundPolicyFlag = refundPolicyFlag {
                params["refund_policy_flag"] = unwrappedRefundPolicyFlag
            }
            
            if let unwrappedShippingPolicyDetails = shippingPolicyDetails {
                params["shipping_policy_details"] = unwrappedShippingPolicyDetails
            }
            
            if let unwrappedShippingPolicyFlag = shippingPolicyFlag {
                params["shipping_policy_flag"] = unwrappedShippingPolicyFlag
            }
            
            if let unwrappedStatus = status {
                params["status"] = unwrappedStatus
            }
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
            
        case let .executePayment(couponCode, customer, formResponse, paymentGatewayName, paymentMethodName, paymentLinkUrl):
            var params = ["payment_link_url": paymentLinkUrl] as [String : Any]
            if let unwrappedCouponCode = couponCode {
                params["coupon_code"] = unwrappedCouponCode
            }
            if let unwrappedPaymentGatewayName = paymentGatewayName {
                params["paymentGatewayName"] = unwrappedPaymentGatewayName
            }
            
            if let unwrappedPaymentMethodName = paymentMethodName {
                params["paymentMethodName"] = unwrappedPaymentMethodName
            }
            
            if let unwrappedCustomer = customer {
                params["customer"] = ["address":unwrappedCustomer.address,
                                      "apt_num":unwrappedCustomer.aptNum,
                                      "city":unwrappedCustomer.city,
                                      "country":unwrappedCustomer.country,
                                      "email":unwrappedCustomer.email,
                                      "first_name":unwrappedCustomer.firstName,
                                      "governorate":unwrappedCustomer.governorate,
                                      "last_name":unwrappedCustomer.lastName,
                                      "mobile_number":unwrappedCustomer.mobileNumber]
            }
            
            if let unwrappedFormResponse = formResponse {
                var answers = [[String:Any]]()
                for answer in unwrappedFormResponse.answers {
                    answers.append(["answer":answer.answer, "mandatory":answer.mandatory])
                }
                params["formResponse"] = ["answers":answers,
                                          "customer_mobile":unwrappedFormResponse.customerMobile,
                                          "form_id":unwrappedFormResponse.formId,
                                          "id":unwrappedFormResponse.id]
            }
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
            
        }
    }
}
