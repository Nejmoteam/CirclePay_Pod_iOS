//
//  PaymentLinks.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 22/05/2022.
//

import Foundation
public protocol PaymentLinksProtocol {
    func getAllPaymentLinks(customerMobile:String?, completion: @escaping ([PaymentLinkCodable]?, CirclePayError?) -> Void)
    
    func getPaymentLink(paymentLinkURL: String, completion: @escaping (PaymentLinkURLCodable?, CirclePayError?) -> Void)
    
    func deactivatePaymentLink(paymentLinkURL:String, completion: @escaping (PaymentLinkActivationCodable?, CirclePayError?) -> Void)
    
    func createPaymentLink(name:String, description:String, value:Double, expiryDate:String, completion: @escaping (PaymentLinkCreationCodable?, CirclePayError?) -> Void)
    
    func createPaymentLink(name:String, description:String, value:Double, expiryDate:String, comments:String?, currency:String?,enableSurvey:Bool?, getCustAddress:Bool?,refundPolicyDetails:String?, refundPolicyFlag:Bool?,shippingPolicyDetails:String?, shippingPolicyFlag:Bool?, status:Bool?, completion: @escaping (PaymentLinkCreationCodable?, CirclePayError?) -> Void)
    
    func updatePaymentLink(link:String, name:String?, description:String?, value:Double?, expiryDate:String?, comments:String?, currency:String?,enableSurvey:Bool?, getCustAddress:Bool?,refundPolicyDetails:String?, refundPolicyFlag:Bool?,shippingPolicyDetails:String?, shippingPolicyFlag:Bool?, status:Bool?, completion: @escaping (PaymentLinkCreationCodable?, CirclePayError?) -> Void)
}

public class PaymentLinks: PaymentLinksProtocol {
    private let paymentLinksWorker: PaymentLinksWorkerProtocol = PaymentLinksWorker()
    
    public func getAllPaymentLinks(customerMobile: String?, completion: @escaping ([PaymentLinkCodable]?, CirclePayError?) -> Void) {
        paymentLinksWorker.getAllPaymentLinks(customerMobile: customerMobile) { results in
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
    
    public func getPaymentLink(paymentLinkURL: String, completion: @escaping (PaymentLinkURLCodable?, CirclePayError?) -> Void) {
        paymentLinksWorker.getPaymentLink(paymentLinkURL: paymentLinkURL) { results in
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
    
    public func deactivatePaymentLink(paymentLinkURL: String, completion: @escaping (PaymentLinkActivationCodable?, CirclePayError?) -> Void) {
        paymentLinksWorker.deactivatePaymentLink(paymentLinkURL: paymentLinkURL) { results in
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
    
    public func createPaymentLink(name: String, description: String, value: Double, expiryDate: String, completion: @escaping (PaymentLinkCreationCodable?, CirclePayError?) -> Void) {
        paymentLinksWorker.createPaymentLink(name: name, description: description, value: value, expiryDate: expiryDate, comments: nil, currency: nil, enableSurvey: nil, getCustAddress: nil, refundPolicyDetails: nil, refundPolicyFlag: nil, shippingPolicyDetails: nil, shippingPolicyFlag: nil, status: nil) { results in
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
    
    public func createPaymentLink(name: String, description: String, value: Double, expiryDate: String, comments: String?, currency: String?, enableSurvey: Bool?, getCustAddress: Bool?, refundPolicyDetails: String?, refundPolicyFlag: Bool?, shippingPolicyDetails: String?, shippingPolicyFlag: Bool?, status: Bool?, completion: @escaping (PaymentLinkCreationCodable?, CirclePayError?) -> Void) {
        paymentLinksWorker.createPaymentLink(name: name, description: description, value: value, expiryDate: expiryDate, comments: comments, currency: currency, enableSurvey: enableSurvey, getCustAddress: getCustAddress, refundPolicyDetails: refundPolicyDetails, refundPolicyFlag: refundPolicyFlag, shippingPolicyDetails: shippingPolicyDetails, shippingPolicyFlag: shippingPolicyFlag, status: status) { results in
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
    
    public func updatePaymentLink(link: String, name: String?, description: String?, value: Double?, expiryDate: String?, comments: String?, currency: String?, enableSurvey: Bool?, getCustAddress: Bool?, refundPolicyDetails: String?, refundPolicyFlag: Bool?, shippingPolicyDetails: String?, shippingPolicyFlag: Bool?, status: Bool?, completion: @escaping (PaymentLinkCreationCodable?, CirclePayError?) -> Void) {
        paymentLinksWorker.updatePaymentLink(link: link, name: name, description: description, value: value, expiryDate: expiryDate, comments: comments, currency: currency, enableSurvey: enableSurvey, getCustAddress: getCustAddress, refundPolicyDetails: refundPolicyDetails, refundPolicyFlag: refundPolicyFlag, shippingPolicyDetails: shippingPolicyDetails, shippingPolicyFlag: shippingPolicyFlag, status: status) { results in
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
}
