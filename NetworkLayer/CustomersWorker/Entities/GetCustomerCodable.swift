//
//  GetCustomerCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 07/04/2022.
//

import Foundation

public struct GetCustomerCodable: Codable{
    let firstName:String?
    let lastName:String?
    let email:String?
    let mobileNumber:String?
    let country:String?
    let governorate:String?
    let city:String?
    let address:String?
    let aptNumber:String?
    
    enum CodingKeys:String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case mobileNumber = "mobile_number"
        case aptNumber = "apt_num"
        case email, country, governorate, city, address
    }
}
