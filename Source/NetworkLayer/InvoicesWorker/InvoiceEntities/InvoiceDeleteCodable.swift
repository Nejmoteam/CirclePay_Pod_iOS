//
//  InvoiceDeleteCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 08/04/2022.
//

import Foundation

public struct InvoiceDeleteCodable:Codable {
    let invoiceNumber:String?
    enum CodingKeys: String, CodingKey {
        case invoiceNumber = "invoice_number"
    }
}
