//
//  PaymentLinkCreationCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 22/05/2022.
//

import Foundation
public struct PaymentLinkCreationCodable: Codable {
    let link:String?
    let paymentLinkUrl:String?
    
    enum CodingKeys:String, CodingKey {
        case link
        case paymentLinkUrl = "payment_link_url"
    }
}
