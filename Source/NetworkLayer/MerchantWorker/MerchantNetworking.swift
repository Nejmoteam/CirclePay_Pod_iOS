//
//  PaymentLinksNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 03/01/2022.
//
import Alamofire
import Foundation
enum MerchantsNetworking {
    case create(firstName:String, lastName:String, email:String, mobileNumber:String, businessName:String, businessAddress:String, callbackURL:String)
    
    case get
    
    case list
    
    case update(firstName:String, lastName:String, email:String, mobileNumber:String, businessName:String, businessAddress:String, callbackURL:String)
    
    case enablePaymentGateway(paymentGatewayId:String)
    
    case disablePaymentGateway(paymentGatewayId:String)
    
    case listPaymentGateways
    
    case enablePaymentMethod(paymentMethodId:String)
    
    case disablePaymentMethod(paymentMethodId:String)
    
    case listPaymentMethods
    
    case sendOTP(countryCode:String, mobileNumber:String)
    
    case verifyMerchant(merchantMobile:String, OTP:String)
    
    case getPaymentMethodForMobile
}

extension MerchantsNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .create:
            return "merchants/create"
        
        case .get:
            return "merchants/get"
        
        case .list:
            return "merchants/list"
        
        case .update:
            return "merchants/update"
        
        case let .enablePaymentGateway(paymentGatewayId):
            return "merchants/payment/gateway/enable/\(paymentGatewayId)"
        
        case let .disablePaymentGateway(paymentGatewayId):
            return "merchants/payment/gateway/disable/\(paymentGatewayId)"
        
        case .listPaymentGateways:
            return "merchants/payment/gateway/list"
            
        case let .enablePaymentMethod(paymentMethodId):
            return "merchants/payment/method/enable/\(paymentMethodId)"
            
        case let .disablePaymentMethod(paymentMethodId):
            return "merchants/payment/method/disable/\(paymentMethodId)"
            
        case .listPaymentMethods:
            return "merchants/payment/method/list"
        
        case .sendOTP:
            return "merchants/send/otp"
            
        case .verifyMerchant:
            return "merchants/verify"
            
        case .getPaymentMethodForMobile:
            return "merchants/payment/method/list/mobile"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .create:
            return .post
       
        case .get:
            return .get
        
        case .list:
            return .get
        
        case .update:
            return .put
        
        case .enablePaymentGateway:
            return .get
        
        case .disablePaymentGateway:
            return .delete
        
        case .listPaymentGateways:
            return .get
            
        case .enablePaymentMethod:
            return .get
            
        case .disablePaymentMethod:
            return .delete
            
        case .listPaymentMethods:
            return .get
        
        case .sendOTP:
            return .post
            
        case .verifyMerchant:
            return .post
            
        case .getPaymentMethodForMobile:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .create(firstName, lastName, email, mobileNumber, businessName, businessAddress, callbackURL):
            let params = ["first_name":firstName, "last_name":lastName, "email":email, "mobile_number":mobileNumber, "business_name":businessName, "business_address":businessAddress, "callback_url":callbackURL]
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
       
        case .get:
            return .normalRequest
        
        case .list:
            return .normalRequest
        
        case let .update(firstName, lastName, email, mobileNumber, businessName, businessAddress, callbackURL):
            let params = ["first_name":firstName, "last_name":lastName, "email":email, "mobile_number":mobileNumber, "business_name":businessName, "business_address":businessAddress, "callback_url":callbackURL]
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
        
        case .enablePaymentGateway:
            return .normalRequest
        
        case .disablePaymentGateway:
            return .normalRequest
        
        case .listPaymentGateways:
            return .normalRequest
            
        case .enablePaymentMethod:
            return .normalRequest
            
        case .disablePaymentMethod:
            return .normalRequest
            
        case .listPaymentMethods:
            return .normalRequest
            
        case let .sendOTP(countryCode, mobileNumber):
            let params = ["country_code":countryCode, "mobile_number":mobileNumber]
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
            
        case let .verifyMerchant(merchantMobile, OTP):
            let params = ["merchant_mobile":merchantMobile, "otp":OTP]
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
        case .getPaymentMethodForMobile:
            return .normalRequest
        }
    }
}
