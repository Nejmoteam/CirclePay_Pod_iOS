//
//  RequestRefundCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation

public struct RequestRefundCodable:Codable {
   public let refundId:Int?
    
    enum CodingKeys:String, CodingKey {
        case refundId = "refund_id"
    }
}
