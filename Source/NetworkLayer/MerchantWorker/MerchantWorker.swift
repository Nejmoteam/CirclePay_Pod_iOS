//
//  MerchantWorker.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 10/04/2022.
//

import Foundation

protocol MerchantsWorkerProtocol {
    func create(firstName:String, lastName:String, email:String, mobileNumber:String, businessName:String, businessAddress:String, callbackURL:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantCreateCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func get(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func list(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func update(firstName:String, lastName:String, email:String, mobileNumber:String, businessName:String, businessAddress:String, callbackURL:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func enablePaymentGateway(paymentGatewayId:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantPaymentGatewayEnabledCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func disablePaymentGateway(paymentGatewayId:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantPaymentGatewayEnabledCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func listPaymentGateways(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantPaymentGatewayCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func enablePaymentMethod(paymentMethodId:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantPaymentMethodEnabledCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func disablePaymentMethod(paymentMethodId:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantPaymentMethodEnabledCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func listPaymentMethods(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantPaymentMethodCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func sendOTP(countryCode:String, mobileNumber:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantSendOTPCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func verifyMerchant(merchantMobile:String, OTP:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[ResponseDataEmptyObject]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func getPaymentMethodsForMobile(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantPaymentMethodsMobile]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class MerchantsWorker: APIRequestExecuter<MerchantsNetworking>, MerchantsWorkerProtocol {
    func create(firstName: String, lastName: String, email: String, mobileNumber: String, businessName: String, businessAddress: String, callbackURL: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantCreateCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .create(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, businessName: businessName, businessAddress: businessAddress, callbackURL: callbackURL), responseClass: BaseAPIRequestResponseModel<[MerchantCreateCodable]>.self) { results in
            completion(results)
        }
    }
    
    func get(completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .get, responseClass: BaseAPIRequestResponseModel<[MerchantCodable]>.self) { results in
            completion(results)
        }
    }
    
    func list(completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .list, responseClass: BaseAPIRequestResponseModel<[MerchantCodable]>.self) { results in
            completion(results)
        }
    }
    
    func update(firstName: String, lastName: String, email: String, mobileNumber: String, businessName: String, businessAddress: String, callbackURL: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .update(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, businessName: businessName, businessAddress: businessAddress, callbackURL: callbackURL), responseClass: BaseAPIRequestResponseModel<[MerchantCodable]>.self) { results in
            completion(results)
        }
    }
    
    func enablePaymentGateway(paymentGatewayId: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantPaymentGatewayEnabledCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .enablePaymentGateway(paymentGatewayId: paymentGatewayId), responseClass: BaseAPIRequestResponseModel<[MerchantPaymentGatewayEnabledCodable]>.self) { results in
            completion(results)
        }
    }
    
    func disablePaymentGateway(paymentGatewayId: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantPaymentGatewayEnabledCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .disablePaymentGateway(paymentGatewayId: paymentGatewayId), responseClass: BaseAPIRequestResponseModel<[MerchantPaymentGatewayEnabledCodable]>.self) { results in
            completion(results)
        }
    }
    
    func listPaymentGateways(completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantPaymentGatewayCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .listPaymentGateways, responseClass: BaseAPIRequestResponseModel<[MerchantPaymentGatewayCodable]>.self) { results in
            completion(results)
        }
    }
    
    func enablePaymentMethod(paymentMethodId: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantPaymentMethodEnabledCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .enablePaymentMethod(paymentMethodId: paymentMethodId), responseClass: BaseAPIRequestResponseModel<[MerchantPaymentMethodEnabledCodable]>.self) { results in
            completion(results)
        }
    }
    
    func disablePaymentMethod(paymentMethodId: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantPaymentMethodEnabledCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .disablePaymentMethod(paymentMethodId: paymentMethodId), responseClass: BaseAPIRequestResponseModel<[MerchantPaymentMethodEnabledCodable]>.self) { results in
            completion(results)
        }
    }
    
    func listPaymentMethods(completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantPaymentMethodCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .listPaymentMethods, responseClass: BaseAPIRequestResponseModel<[MerchantPaymentMethodCodable]>.self) { results in
            completion(results)
        }
    }
    
    func sendOTP(countryCode: String, mobileNumber: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[MerchantSendOTPCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .sendOTP(countryCode: countryCode, mobileNumber: mobileNumber), responseClass: BaseAPIRequestResponseModel<[MerchantSendOTPCodable]>.self) { results in
            completion(results)
        }
    }
    
    func verifyMerchant(merchantMobile: String, OTP: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[ResponseDataEmptyObject]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .verifyMerchant(merchantMobile: merchantMobile, OTP: OTP), responseClass: BaseAPIRequestResponseModel<[ResponseDataEmptyObject]>.self) { results in
            completion(results)
        }
    }
    
    func getPaymentMethodsForMobile(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[MerchantPaymentMethodsMobile]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getPaymentMethodForMobile, responseClass: BaseAPIRequestResponseModel<[MerchantPaymentMethodsMobile]>.self) { results in
            completion(results)
        }
    }
}
