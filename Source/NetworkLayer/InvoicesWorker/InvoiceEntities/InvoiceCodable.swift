//
//  InvoiceCodable.swift
//  Alamofire
//
//  Created by apple on 08/04/2022.
//

import Foundation
public struct InvoiceCodable:Codable {
    let invoiceNumber:String?
    let items: [InvoiceItemsCodable]?
    let customerMobile:String?
    let status:Int?
    let createDate:String?
    let dueDate:String?
    let prefPaymenMethod:String?
    let shippingFees:Double?
    let discountValue:Double?
    let discountType:String?
    let discountValueCalculated:Double?
    let tax:Double?
    let taxValue:Double?
    let shippingPolicy:String?
    let returnPolicy:String?
    let extraNotes:String?
    
    enum CodingKeys: String, CodingKey {
        case invoiceNumber = "invoice_number"
        case customerMobile = "customer_mobile"
        case createDate = "create_date"
        case dueDate = "due_date"
        case prefPaymenMethod = "pref_payment_method"
        case shippingFees = "shipping_fees"
        case discountValue = "discount_value"
        case discountType = "discount_type"
        case discountValueCalculated = "discount_value_calculated"
        case taxValue = "tax_value"
        case shippingPolicy = "shipping_policy"
        case returnPolicy = "return_policy"
        case extraNotes = "extra_notes"
        case items, status, tax
    }
}

public struct InvoiceItemsCodable:Codable {
    let name:String?
    let description:String?
    let quantity:Int?
    let price:Double?
}
