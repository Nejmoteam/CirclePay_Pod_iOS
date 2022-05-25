//
//  PaymentLinkCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 22/05/2022.
//

import Foundation
public struct PaymentLinkCodable: Codable {
    let link:String?
    let enableSurvey:Bool?
    let lastUsed:String?
    let editable:Bool?
    let description:String?
    let currency:String?
    let formId:String?
    let value:Double?
    let expiryDate:String?
    let createDate:String?
    let status:Bool?
    let totalRevenue:Double?
    let totalRefund:Double?
    let totalTransactions:Double?
    let shippingPolicyFlag:Bool?
    let refundPolicyFlag:Bool?
    let shippingPolicyDetails:String?
    let refundPolicyDetails:String?
    let comments:String?
    let name:String?
    let getCustAddress:Bool?
    
    enum CodingKeys:String, CodingKey {
        case link
        case enableSurvey = "enable_survey"
        case lastUsed = "last_used"
        case editable
        case description
        case currency
        case formId = "form_id"
        case value
        case expiryDate = "expiry_date"
        case createDate = "create_date"
        case status
        case totalRevenue = "total_revenue"
        case totalRefund = "total_refund"
        case totalTransactions = "total_transactions"
        case shippingPolicyFlag = "shipping_policy_flag"
        case refundPolicyFlag = "refund_policy_flag"
        case shippingPolicyDetails = "shipping_policy_details"
        case refundPolicyDetails = "refund_policy_details"
        case comments
        case name
        case getCustAddress = "get_cust_address"
    }
}
