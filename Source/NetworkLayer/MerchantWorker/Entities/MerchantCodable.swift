//
//  MerchantCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 10/04/2022.
//

import Foundation

public struct MerchantCodable: Codable {
    public let firstName:String?
    public let lastName:String?
    public let email:String?
    public let mobileNumber:String?
    public let businessName:String?
    public let businessAddress:String?
    public let refundPolicy:String?
    public let shippingPolicy:String?
    public  let status:String?
    public  let merchantToken:String?
    
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
