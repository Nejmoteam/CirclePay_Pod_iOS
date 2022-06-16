//
//  MerchantPaymentMethodsMobile.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 16/06/2022.
//

import Foundation
// MARK: - Datum
struct MerchantPaymentMethodsMobile: Codable {
    let id, name, gatewayID: String?
    let status: Bool?
    let rateObject: RateObject?
    let paymentGatewayName: String?
    let paymentMethodURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case gatewayID = "gateway_id"
        case status
        case rateObject = "rate_Object"
        case paymentGatewayName = "payment_gateway_name"
        case paymentMethodURL = "payment_method_url"
    }
    
    func transformToPaymentMethodMobile() -> PaymentMethodsViewModel {
        return PaymentMethodsViewModel(paymentMethodId: self.id ?? "", paymentMethodName: self.name ?? "", paymentGetwayId: self.gatewayID ?? "", paymentGetwayName: self.paymentGatewayName ?? "", image: self.paymentMethodURL ?? "")
    }
}

// MARK: - RateObject
struct RateObject: Codable {
    let paymentFeePercentage, paymentFeeAmount, refundFeePercentage, refundFeeAmount: Int?

    enum CodingKeys: String, CodingKey {
        case paymentFeePercentage = "payment_fee_percentage"
        case paymentFeeAmount = "payment_fee_amount"
        case refundFeePercentage = "refund_fee_percentage"
        case refundFeeAmount = "refund_fee_amount"
    }
}
