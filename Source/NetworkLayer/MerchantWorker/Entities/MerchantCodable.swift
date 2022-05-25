//
//  MerchantCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 10/04/2022.
//

import Foundation

public struct MerchantCodable: Codable {
    let firstName:String?
    let lastName:String?
    let email:String?
    let mobileNumber:String?
    let businessName:String?
    let businessAddress:String?
    let refundPolicy:String?
    let shippingPolicy:String?
    let status:String?
    let merchantToken:String?
    
    enum CodingKeys:String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case mobileNumber = "mobile_number"
        case businessName = "business_name"
        case businessAddress = "business_address"
        case refundPolicy = "refund_policy"
        case shippingPolicy = "shipping_policy"
        case merchantToken = "merchant_token"
        case email, status
    }
    
    public func getFullName() -> String {
        let fistName = self.firstName ?? ""
        let lastName = self.lastName ?? ""
        return  fistName + " " + lastName
    }
}
