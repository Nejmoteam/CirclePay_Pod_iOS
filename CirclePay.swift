//
//  CirclePay.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 06/04/2022.
//

import Foundation
public class CirclePay {
    public static var merchantToken:String = ""
    public static var accountToken:String = ""
    public static var accountKey:String = ""
    public init () {}
    public static let customers : CustomersProtocol = Customers()
    public static let invoices: InvoicesProtocol = Invoices()
    public static let merchants: MerchantsProtocol = Merchants()
}
