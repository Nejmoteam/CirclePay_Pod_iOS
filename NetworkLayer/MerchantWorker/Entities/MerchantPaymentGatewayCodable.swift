//
//  MerchantGatewayCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 11/04/2022.
//

import Foundation
public struct MerchantPaymentGatewayCodable:Codable {
    let id:String?
    let name:String?
    let status:Bool?
    let config:MerchantPaymentGatewayConfigure?
}

public struct MerchantPaymentGatewayConfigure:Codable {
    let apiKey:String?
}
