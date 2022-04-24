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
    public static let payments: PaymentsProtocol = Payments()
    public static let refunds: RefundsProtocol = Refunds()
    public static let paymentGateways: PaymentGatewaysProtocol = PaymentGateways()
    public static let paymentMethods: PaymentMethodsProtocol = PaymentMethods()
    public static var mode: Inviroment = .sandBox
}


public enum Inviroment: String {
    case production = "https://staging-openapi.circlepay.ai/"
    case sandBox =  "SandBox ..."
}
