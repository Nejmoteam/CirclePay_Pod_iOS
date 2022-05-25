//
//  PaymentWorker.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation

protocol PaymentLinksWorkerProtocol {
    func getAllPaymentLinks(customerMobile:String?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentLinkCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func getPaymentLink(paymentLinkURL:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentLinkURLCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func deactivatePaymentLink(paymentLinkURL:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentLinkActivationCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func createPaymentLink(name:String, description:String, value:Double, expiryDate:String, comments:String?, currency:String?,enableSurvey:Bool?, getCustAddress:Bool?,refundPolicyDetails:String?, refundPolicyFlag:Bool?,shippingPolicyDetails:String?, shippingPolicyFlag:Bool?, status:Bool?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentLinkCreationCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func updatePaymentLink(link:String, name:String?, description:String?, value:Double?, expiryDate:String?, comments:String?, currency:String?,enableSurvey:Bool?, getCustAddress:Bool?,refundPolicyDetails:String?, refundPolicyFlag:Bool?,shippingPolicyDetails:String?, shippingPolicyFlag:Bool?, status:Bool?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentLinkCreationCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
//    func executePayment(couponCode:String?, customer:PaymentLinkCustomer?, formResponse:PaymentLinkFormResponse? , paymentGatewayName:String?, paymentMethodName:String?, paymentLinkUrl:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentLinkCreationCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class PaymentLinksWorker: APIRequestExecuter<PaymentLinksNetworking>, PaymentLinksWorkerProtocol {
    func getAllPaymentLinks(customerMobile: String?, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentLinkCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getAllPaymentLinks(customerMobile: customerMobile), responseClass: BaseAPIRequestResponseModel<[PaymentLinkCodable]>.self) { results in
            completion(results)
        }
    }
    
    func getPaymentLink(paymentLinkURL: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentLinkURLCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getPaymentLink(paymentLinkURL: paymentLinkURL), responseClass: BaseAPIRequestResponseModel<[PaymentLinkURLCodable]>.self) { results in
            completion(results)
        }
    }
    
    func deactivatePaymentLink(paymentLinkURL: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentLinkActivationCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .deactivatePaymentLink(paymentLinkURL: paymentLinkURL), responseClass: BaseAPIRequestResponseModel<[PaymentLinkActivationCodable]>.self) { results in
            completion(results)
        }
    }
    
    func createPaymentLink(name: String, description: String, value: Double, expiryDate: String, comments: String?, currency: String?, enableSurvey: Bool?, getCustAddress: Bool?, refundPolicyDetails: String?, refundPolicyFlag: Bool?, shippingPolicyDetails: String?, shippingPolicyFlag: Bool?, status: Bool?, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentLinkCreationCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .createPaymentLink(name: name, description: description, value: value, expiryDate: expiryDate, comments: comments, currency: currency, enableSurvey: enableSurvey, getCustAddress: getCustAddress, refundPolicyDetails: refundPolicyDetails, refundPolicyFlag: refundPolicyFlag, shippingPolicyDetails: shippingPolicyDetails, shippingPolicyFlag: shippingPolicyFlag, status: status), responseClass: BaseAPIRequestResponseModel<[PaymentLinkCreationCodable]>.self) { results in
            completion(results)
        }
    }
    
    func updatePaymentLink(link: String, name: String?, description: String?, value: Double?, expiryDate: String?, comments: String?, currency: String?, enableSurvey: Bool?, getCustAddress: Bool?, refundPolicyDetails: String?, refundPolicyFlag: Bool?, shippingPolicyDetails: String?, shippingPolicyFlag: Bool?, status: Bool?, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentLinkCreationCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .updatePaymentLink(link: link, name: name, description: description, value: value, expiryDate: expiryDate, comments: comments, currency: currency, enableSurvey: enableSurvey, getCustAddress: getCustAddress, refundPolicyDetails: refundPolicyDetails, refundPolicyFlag: refundPolicyFlag, shippingPolicyDetails: shippingPolicyDetails, shippingPolicyFlag: shippingPolicyFlag, status: status), responseClass: BaseAPIRequestResponseModel<[PaymentLinkCreationCodable]>.self) { results in
            completion(results)
        }
    }
}
