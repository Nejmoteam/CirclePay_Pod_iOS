//
//  UpdateCustomerCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 07/04/2022.
//

import Foundation

public struct UpdateCustomerCodable:Codable {
   public let customerMobileNumber:String?
    
    enum CodingKeys: String, CodingKey {
        case customerMobileNumber = "customer_mobile_number"
    }
}
