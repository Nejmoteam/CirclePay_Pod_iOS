//
//  CirclePay.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 06/04/2022.
//

import Foundation
import FontBlaster
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
    public static let paymentLinks: PaymentLinksProtocol = PaymentLinks()
    public static var mode: Inviroment = .sandBox
    
    public static func prepareSDK() {
        FontBlaster.debugEnabled = true
        FontBlaster.blast()
        
    }
    
    public static func excutePayment(with paymentType: PaymentType) {
        switch paymentType {
        case .PaymentLink:
            if let vc = UIApplication.shared.topMostViewController() {
                let paymentLinkScreen = PaymentLinkFirstScreenRouter.createAnModule()
                paymentLinkScreen.modalPresentationStyle = .fullScreen
                vc.present(paymentLinkScreen, animated: true, completion: nil)
            } else {
                print("failed to get top view Controller")
            }
        case .Invoice:
            if let vc = UIApplication.shared.topMostViewController() {
                let paymentLinkScreen = InvoiceFirstScreenRouter.createAnModule()
                paymentLinkScreen.modalPresentationStyle = .fullScreen
                vc.present(paymentLinkScreen, animated: true, completion: nil)
            } else {
                print("failed to get top view Controller")
            }
        }
    }
}


public enum Inviroment: String {
    case staging = "https://staging-openapi.circlepay.ai/"
    // case preProduction = "https://preprod-openapi-admin.circlepay.ai"
    case production = "https://openapi-admin.circlepay.ai/"
    case sandBox =  "https://sandbox-openapi-admin.circlepay.ai/"
}


public enum PaymentType {
    case PaymentLink
    case Invoice
}
