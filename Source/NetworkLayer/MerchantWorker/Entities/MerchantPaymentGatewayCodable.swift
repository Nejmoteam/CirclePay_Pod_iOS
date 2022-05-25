//
//  MerchantGatewayCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 11/04/2022.
//

import Foundation
public struct MerchantPaymentGatewayCodable:Codable {
   public let id:String?
   public let name:String?
   public let status:Bool?
   public let config:MerchantPaymentGatewayConfigure?
}

public struct MerchantPaymentGatewayConfigure:Codable {
   public let apiKey:String?
}
