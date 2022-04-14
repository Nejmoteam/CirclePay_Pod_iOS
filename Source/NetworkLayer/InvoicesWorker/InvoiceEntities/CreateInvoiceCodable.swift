//
//  CreateInvoiceCodable.swift
//  Alamofire
//
//  Created by apple on 08/04/2022.
//

import Foundation

public struct CreateInvoiceCodable:Codable {
    let invoiceNumber:String?
    let invoiceUrl:String?
    
    enum CodingKeys: String, CodingKey {
        case invoiceNumber = "invoice_number"
        case invoiceUrl = "invoice_url"
    }
}
