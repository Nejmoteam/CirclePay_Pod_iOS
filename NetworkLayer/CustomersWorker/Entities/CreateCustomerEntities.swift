//
//  CreateCustomerEntities.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 06/04/2022.
//

import Foundation

public struct CreateCustomerCodable:Codable {
    let customerMobileNumber:String?
    
    enum CodingKeys: String, CodingKey {
        case customerMobileNumber = "customer_mobile_number"
    }
}
