//
//  Merchant.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 10/04/2022.
//

import Foundation
public protocol MerchantsProtocol {
    func createMerchant(firstName: String, lastName: String, email: String, mobileNumber: String, businessName: String, businessAddress: String, callbackURL: String, completion: @escaping (MerchantCreateCodable?, CirclePayError?) -> Void)
    
    func getMerchant(completion: @escaping (MerchantCodable?, CirclePayError?) -> Void)
    
    func getAllMerchants(completion: @escaping ([MerchantCodable]?, CirclePayError?) -> Void)
    
    func updateMerchant(firstName:String, lastName:String, email:String, mobileNumber:String, businessName:String, businessAddress:String, callbackURL:String, completion: @escaping (MerchantCodable?, CirclePayError?) -> Void)
    
    func enablePaymentGateway(paymentGatewayId:String, completion: @escaping (MerchantPaymentGatewayEnabledCodable?, CirclePayError?) -> Void)
    
    func disablePaymentGateway(paymentGatewayId:String, completion: @escaping (MerchantPaymentGatewayEnabledCodable?, CirclePayError?) -> Void)
    
    func listPaymentGateways(completion: @escaping ([MerchantPaymentGatewayCodable]?, CirclePayError?) -> Void)
    
    func enablePaymentMethod(paymentMethodId:String, completion: @escaping (MerchantPaymentMethodEnabledCodable?, CirclePayError?) -> Void)
    
    func disablePaymentMethod(paymentMethodId:String, completion: @escaping (MerchantPaymentMethodEnabledCodable?, CirclePayError?) -> Void)
    
    func listPaymentMethods(completion: @escaping ([MerchantPaymentMethodCodable]?, CirclePayError?) -> Void)
    
    func sendOTP(countryCode:String, mobileNumber:String, completion: @escaping (MerchantSendOTPCodable?, CirclePayError?) -> Void)
    
    func verifyMerchant(merchantMobile: String, OTP: String, completion: @escaping (verified?, CirclePayError?) -> Void)
}

public class Merchants: MerchantsProtocol {
    private let merchantWorker: MerchantsWorkerProtocol = MerchantsWorker()
    
    public func createMerchant(firstName: String, lastName: String, email: String, mobileNumber: String, businessName: String, businessAddress: String, callbackURL: String, completion: @escaping (MerchantCreateCodable?, CirclePayError?) -> Void) {
        self.merchantWorker.create(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, businessName: businessName, businessAddress: businessAddress, callbackURL: callbackURL) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func getMerchant(completion: @escaping (MerchantCodable?, CirclePayError?) -> Void) {
        self.merchantWorker.get { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func getAllMerchants(completion: @escaping ([MerchantCodable]?, CirclePayError?) -> Void) {
        self.merchantWorker.list { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func updateMerchant(firstName: String, lastName: String, email: String, mobileNumber: String, businessName: String, businessAddress: String, callbackURL: String, completion: @escaping (MerchantCodable?, CirclePayError?) -> Void) {
        merchantWorker.update(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, businessName: businessName, businessAddress: businessAddress, callbackURL: callbackURL) { results in
            switch results{
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func enablePaymentGateway(paymentGatewayId: String, completion: @escaping (MerchantPaymentGatewayEnabledCodable?, CirclePayError?) -> Void) {
        merchantWorker.enablePaymentGateway(paymentGatewayId: paymentGatewayId) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func disablePaymentGateway(paymentGatewayId: String, completion: @escaping (MerchantPaymentGatewayEnabledCodable?, CirclePayError?) -> Void) {
        merchantWorker.disablePaymentGateway(paymentGatewayId: paymentGatewayId) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func listPaymentGateways(completion: @escaping ([MerchantPaymentGatewayCodable]?, CirclePayError?) -> Void) {
        merchantWorker.listPaymentGateways { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func enablePaymentMethod(paymentMethodId: String, completion: @escaping (MerchantPaymentMethodEnabledCodable?, CirclePayError?) -> Void) {
        merchantWorker.enablePaymentMethod(paymentMethodId: paymentMethodId) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func disablePaymentMethod(paymentMethodId: String, completion: @escaping (MerchantPaymentMethodEnabledCodable?, CirclePayError?) -> Void) {
        merchantWorker.disablePaymentMethod(paymentMethodId: paymentMethodId) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func listPaymentMethods(completion: @escaping ([MerchantPaymentMethodCodable]?, CirclePayError?) -> Void) {
        merchantWorker.listPaymentMethods { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func sendOTP(countryCode: String, mobileNumber: String, completion: @escaping (MerchantSendOTPCodable?, CirclePayError?) -> Void) {
        var finalMobibleNumber = ""
        if mobileNumber.first == "0" || mobileNumber.first == "٠"{
            finalMobibleNumber =  String(mobileNumber.dropFirst())
        } else {
            finalMobibleNumber = mobileNumber
        }
        merchantWorker.sendOTP(countryCode: countryCode, mobileNumber: finalMobibleNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func verifyMerchant(merchantMobile: String, OTP: String, completion: @escaping (verified?, CirclePayError?) -> Void) {
        merchantWorker.verifyMerchant(merchantMobile: merchantMobile, OTP: OTP) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(true, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
}

public typealias verified = Bool
