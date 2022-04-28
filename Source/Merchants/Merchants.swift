//
//  Merchant.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 10/04/2022.
//

import Foundation
public protocol MerchantsProtocol {
    func createMerchant(firstName:String, lastName:String, email:String, mobileNumber:String, businessName:String, businessAddress:String, callbackURL:String, completion: @escaping (MerchantCreateCodable?, String?) -> Void)
    
    func getMerchant(completion: @escaping (MerchantCodable?, String?) -> Void)
    
    func getAllMerchants(completion: @escaping ([MerchantCodable]?, String?) -> Void)
    
    func updateMerchant(firstName:String, lastName:String, email:String, mobileNumber:String, businessName:String, businessAddress:String, callbackURL:String, completion: @escaping (MerchantCodable?, String?) -> Void)
    
    func enablePaymentGateway(paymentGatewayId:String, completion: @escaping (MerchantPaymentGatewayEnabledCodable?, String?) -> Void)
    
    func disablePaymentGateway(paymentGatewayId:String, completion: @escaping (MerchantPaymentGatewayEnabledCodable?, String?) -> Void)
    
    func listPaymentGateways(completion: @escaping ([MerchantPaymentGatewayCodable]?, String?) -> Void)
    
    func enablePaymentMethod(paymentMethodId:String, completion: @escaping (MerchantPaymentMethodEnabledCodable?, String?) -> Void)
    
    func disablePaymentMethod(paymentMethodId:String, completion: @escaping (MerchantPaymentMethodEnabledCodable?, String?) -> Void)
    
    func listPaymentMethods(completion: @escaping ([MerchantPaymentMethodCodable]?, String?) -> Void)
    
    func sendOTP(countryCode:String, mobileNumber:String, completion: @escaping (MerchantSendOTPCodable?, String?) -> Void)
    
    func verifyMerchant(merchantMobile: String, OTP: String, completion: @escaping (Bool?, String?) -> Void)
}

public class Merchants: MerchantsProtocol {
    private let merchantWorker: MerchantsWorkerProtocol = MerchantsWorker()
    public func createMerchant(firstName: String, lastName: String, email: String, mobileNumber: String, businessName: String, businessAddress: String, callbackURL: String, completion: @escaping (MerchantCreateCodable?, String?) -> Void) {
        self.merchantWorker.create(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, businessName: businessName, businessAddress: businessAddress, callbackURL: callbackURL) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func getMerchant(completion: @escaping (MerchantCodable?, String?) -> Void) {
        self.merchantWorker.get { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func getAllMerchants(completion: @escaping ([MerchantCodable]?, String?) -> Void) {
        self.merchantWorker.list { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func updateMerchant(firstName: String, lastName: String, email: String, mobileNumber: String, businessName: String, businessAddress: String, callbackURL: String, completion: @escaping (MerchantCodable?, String?) -> Void) {
        merchantWorker.update(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, businessName: businessName, businessAddress: businessAddress, callbackURL: callbackURL) { results in
            switch results{
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func enablePaymentGateway(paymentGatewayId: String, completion: @escaping (MerchantPaymentGatewayEnabledCodable?, String?) -> Void) {
        merchantWorker.enablePaymentGateway(paymentGatewayId: paymentGatewayId) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func disablePaymentGateway(paymentGatewayId: String, completion: @escaping (MerchantPaymentGatewayEnabledCodable?, String?) -> Void) {
        merchantWorker.disablePaymentGateway(paymentGatewayId: paymentGatewayId) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func listPaymentGateways(completion: @escaping ([MerchantPaymentGatewayCodable]?, String?) -> Void) {
        merchantWorker.listPaymentGateways { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func enablePaymentMethod(paymentMethodId: String, completion: @escaping (MerchantPaymentMethodEnabledCodable?, String?) -> Void) {
        merchantWorker.enablePaymentMethod(paymentMethodId: paymentMethodId) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func disablePaymentMethod(paymentMethodId: String, completion: @escaping (MerchantPaymentMethodEnabledCodable?, String?) -> Void) {
        merchantWorker.disablePaymentMethod(paymentMethodId: paymentMethodId) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func listPaymentMethods(completion: @escaping ([MerchantPaymentMethodCodable]?, String?) -> Void) {
        merchantWorker.listPaymentMethods { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func sendOTP(countryCode: String, mobileNumber: String, completion: @escaping (MerchantSendOTPCodable?, String?) -> Void) {
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
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func verifyMerchant(merchantMobile: String, OTP: String, completion: @escaping (Bool?, String?) -> Void) {
        merchantWorker.verifyMerchant(merchantMobile: merchantMobile, OTP: OTP) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(true, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
