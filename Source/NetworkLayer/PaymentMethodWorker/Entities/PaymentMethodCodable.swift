//
//  PaymentMethodCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation

public struct PaymentMethodCodable: Codable {
    public let id:String?
    public let name:String?
    public let gatewayId:String?
    
    enum CodingKeys:String, CodingKey {
        case id
        case name
        case gatewayId = "gateway_id"
    }
}
