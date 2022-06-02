//
//  ConfigurationModel.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 31/05/2022.
//

import Foundation


struct BaseAPIResponseConfigurationModel <T: Codable>: Codable {
    let status: Bool?
    let message: String?
    let isError: Bool?
    let errorCode, details: String?
    let data: T?
}


// MARK: - DataClass
struct ConfigurationModel: Codable {
    let id: Int?
    let colorEnable: Bool?
    let configuredAppID: Int?
    let checkoutType: String?
    let logo: String?
    let logoEnable: Bool?
    let color: String?
    let billedFromEnable, billToEnable, invoicePDFEnable, totalPaymentEnable: Bool?
    let accountingEnable, shippingPolicyEnable, refundPolicyEnable, couponEnable: Bool?
    let customerInformationEnable, requireAddressFromCustomerEnable: Bool?
    let createdAt, updatedAt: String?
    let userID: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case colorEnable = "ColorEnable"
        case configuredAppID = "ConfiguredAppId"
        case checkoutType = "CheckoutType"
        case logo = "Logo"
        case logoEnable = "LogoEnable"
        case color = "Color"
        case billedFromEnable = "BilledFromEnable"
        case billToEnable = "BillToEnable"
        case invoicePDFEnable = "InvoicePdfEnable"
        case totalPaymentEnable = "TotalPaymentEnable"
        case accountingEnable = "AccountingEnable"
        case shippingPolicyEnable = "ShippingPolicyEnable"
        case refundPolicyEnable = "RefundPolicyEnable"
        case couponEnable = "CouponEnable"
        case customerInformationEnable = "CustomerInformationEnable"
        case requireAddressFromCustomerEnable = "RequireAddressFromCustomerEnable"
        case createdAt, updatedAt
        case userID = "UserId"
    }
}
