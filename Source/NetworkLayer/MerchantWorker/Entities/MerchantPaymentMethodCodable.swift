//
//  MerchantPaymentMethodCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 11/04/2022.
//

import Foundation

public struct MerchantPaymentMethodCodable:Codable {
   public let id:String?
   public let name:String?
   public let gateWayId:String?
   public let status:Bool?
   public let rateObject:MerchantPaymentMethodRateObjectCodable?
    
    enum CodingKeys:String, CodingKey {
        case id, name, status
        case gateWayId = "gateway_id"
        case rateObject = "rate_Object"
    }
}


public struct MerchantPaymentMethodRateObjectCodable:Codable {
   public let paymentFeePercentage:Double?
   public let paymentFeeAmount:Double?
   public let refundFeePercentage:Double?
   public let refundFeeAmount:Double?
    
    enum CodingKeys:String, CodingKey {
        case paymentFeePercentage = "payment_fee_percentage"
        case paymentFeeAmount = "payment_fee_amount"
        case refundFeePercentage = "refund_fee_percentage"
        case refundFeeAmount = "refund_fee_amount"
    }
}
