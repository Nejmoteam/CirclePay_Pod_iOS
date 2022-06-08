//
//  InvoicePayCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 10/04/2022.
//

import Foundation

public struct InvoicePayCodable: Codable {
    public let transactionId:String?
    public let invoiceUrl:String?
    
    enum CodingKeys:String, CodingKey {
        case transactionId = "transaction_id"
        case invoiceUrl = "invoice_url"
    }
}
