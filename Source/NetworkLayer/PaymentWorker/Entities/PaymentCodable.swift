//
//  PaymentCodable.swift
//  Alamofire
//
//  Created by apple on 12/04/2022.
//

import Foundation

public struct PaymentCodable:Codable {
    public let id:Int?
    public let transactionId:Int?
    public let externalRefId:String?
    public let initDate:String?
    public let updateDate:String?
    public let customerMobile:String?
    public let status:String?
    public let paymentLinkUrl:String?
    public let invoiceNum:String?
    public let value:Double?
    public let netFees:Double?
    public let currency:String?
    public let paymentMethodId:String?
    public let paymentMethodName:String?
    public let paymentGatewayName:String?
    
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
