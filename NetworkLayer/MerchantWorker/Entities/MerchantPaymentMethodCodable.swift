//
//  MerchantPaymentMethodCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 11/04/2022.
//

import Foundation

public struct MerchantPaymentMethodCodable:Codable {
    let id:String?
    let name:String?
    let gateWayId:String?
    let status:Bool?
    let rateObject:MerchantPaymentMethodRateObjectCodable?
    
    enum CodingKeys:String, CodingKey {
        case id, name, status
        case gateWayId = "gateway_id"
        case rateObject = "rate_Object"
    }
}


public struct MerchantPaymentMethodRateObjectCodable:Codable {
    let paymentFeePercentage:Double?
    let paymentFeeAmount:Double?
    let refundFeePercentage:Double?
    let refundFeeAmount:Double?
    
    enum CodingKeys:String, CodingKey {
        case paymentFeePercentage = "payment_fee_percentage"
        case paymentFeeAmount = "payment_fee_amount"
        case refundFeePercentage = "refund_fee_percentage"
        case refundFeeAmount = "refund_fee_amount"
    }
}
