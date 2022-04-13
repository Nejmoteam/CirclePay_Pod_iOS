//
//  MerchantCreateCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 10/04/2022.
//

import Foundation

public struct MerchantCreateCodable:Codable {
    let merchantToken:String?
    
    enum CodingKeys:String, CodingKey {
        case merchantToken = "merchant_token"
    }
}
