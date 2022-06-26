//
//  GetCustomerCodable.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 07/04/2022.
//

import Foundation

public struct CustomerCodable: Codable{
    public let firstName:String?
    public let lastName:String?
    public let email:String?
    public var mobileNumber:String?
    public let country:String?
    public var governorate:String?
    public let city:String?
    public let address:String?
    public let aptNumber:String?
    
    enum CodingKeys:String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case mobileNumber = "mobile_number"
        case aptNumber = "apt_num"
        case email, country, governorate, city, address
    }
    
    public func getFullName() -> String {
        let customerFirstName = self.firstName ?? ""
        let customerLastName = self.lastName ?? ""
        return  customerFirstName + " " + customerLastName
    }
}
