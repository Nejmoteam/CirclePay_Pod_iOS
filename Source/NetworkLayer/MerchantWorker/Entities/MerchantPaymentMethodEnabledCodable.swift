//
//  PaymentMethodEnabledCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 11/04/2022.
//

import Foundation

public struct MerchantPaymentMethodEnabledCodable:Codable {
    public let paymentMethodId: String?
    
    enum CodingKeys:String, CodingKey {
        case paymentMethodId = "payment_method_id"
    }
}
