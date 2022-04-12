//
//  RefundCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 12/04/2022.
//

import Foundation

public struct RefundCodable: Codable {
    let refundId:Int?
    let externalRefId:String?
    let initDate:String?
    let updateDate:String?
    let value:Double?
    let transactionId:String?
    let status:String?
    
    enum CodingKeys:String, CodingKey {
        case refundId = "refund_id"
        case externalRefId = "external_ref_id"
        case initDate = "init_date"
        case updateDate = "update_date"
        case value
        case transactionId = "transaction_id"
        case status
    }
}
