//
//  InvoiceCodable.swift
//  Alamofire
//
//  Created by apple on 08/04/2022.
//

import Foundation
public struct InvoiceCodable:Codable {
    public let invoiceNumber:String?
    public let items: [InvoiceItemsCodable]?
    public let customerMobile:String?
    public let status:Int?
    public let createDate:String?
    public let dueDate:String?
    public let prefPaymenMethod:String?
    public let shippingFees:Double?
    public let discountValue:Double?
    public let discountType:String?
    public let discountValueCalculated:Double?
    public let tax:Double?
    public let taxValue:Double?
    public let shippingPolicy:String?
    public let returnPolicy:String?
    public let extraNotes:String?
    public let totalValue: Double?
    public let subTotalValue: Double?
    
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
        case totalValue = "total_value"
        case subTotalValue = "sub_total_value"
    }
}

public struct InvoiceItemsCodable:Codable {
   public let name:String?
   public let description:String?
   public let quantity:Int?
   public let price:Double?
    
    func getPrice() -> Double {
        if quantity != nil {
            let totalPrice = Double(quantity ?? 0) * (price ?? 0.0)
            return totalPrice
        } else {
            return 0.0
        }
    }
}
