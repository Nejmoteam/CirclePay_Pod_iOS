//
//  PaymentLinkActivationCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 22/05/2022.
//

import Foundation

public struct PaymentLinkActivationCodable: Codable {
    let paymentLinkUrl:String?
    
    enum CodingKeys:String, CodingKey {
        case paymentLinkUrl = "payment_link_url"
    }
}
