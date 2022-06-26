//
//  GatewayCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 11/04/2022.
//

import Foundation

public struct MerchantPaymentGatewayEnabledCodable: Codable {
   public let paymentGatewayId: String?
    
    enum CodingKeys:String, CodingKey {
        case paymentGatewayId = "payment_gateway_id"
    }
}
