//
//  PaymentCodable.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation

public struct PaymentCodable:Codable {
    let id:Int?
    let transactionId:Int?
    let externalRefId:String?
    let initDate:String?
    let updateDate:String?
    let customerMobile:String?
    let status:String?
    let paymentLinkUrl:String?
    let invoiceNum:String?
    let value:Double?
    let netFees:Double?
    let currency:String?
    let paymentMethodId:String?
    let paymentMethodName:String?
    let paymentGatewayName:String?
    
    enum CodingKeys:String, CodingKey {
        case transactionId = "transaction_id"
        case externalRefId = "external_ref_id"
        case initDate = "init_date"
        case updateDate = "update_date"
        case customerMobile = "customer_mobile"
        case paymentLinkUrl = "payment_link_url"
        case invoiceNum = "invoice_num"
        case netFees = "net_fees"
        case paymentMethodId = "payment_method_id"
        case paymentMethodName = "payment_method_name"
        case paymentGatewayName = "payment_gateway_name"
        case id, status, value, currency
    }
}
