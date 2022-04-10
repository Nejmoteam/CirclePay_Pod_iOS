//
//  InvoicesNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 25/12/2021.
//

import Alamofire
import Foundation
enum InvoicesNetworking {
    case create(invoiceNumber:String?,items: [Items], customerMobile:String, status:Int?, createDate:String?, dueDate:String, prefPaymentMethod:String?, shippingFees:Double?, discountValue:Double?, discountType:String?, discountValueCalculated:Double?, tax:Double?, taxValue:Double?, shippingPolicy:String?, returnPolicy:String?, extraNotes:String?)
    
    case list(customerMobile:String?)
    case get(invoiceNumber:String)
    case delete(invoiceNumber:String)
    case pay(invoiceNumber:String, customerMobile:String?, paymentMethodId:String?)
}

extension InvoicesNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .create:
           return "invoice/create"
        case let .list(customerMobile):
            if let unwrappedCustomerMobile = customerMobile {
                return "invoice/list/\(unwrappedCustomerMobile)"
            } else {
                return "invoice/list"
            }
        case let .get(invoiceNumber):
            return "invoice/get/\(invoiceNumber)"
        case let .delete(invoiceNumber):
            return "invoice/delete/\(invoiceNumber)"
        case .pay:
            return "invoice/pay"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .create:
           return .post
        case .list:
            return .get
        case .get:
            return .get
        case .delete:
            return .delete
        case .pay:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .create(invoiceNumber, items, customerMobile, status, createDate, dueDate, prefPaymentMethod, shippingFees, discountValue, discountType, discountValueCalculated, tax, taxValue, shippingPolicy, returnPolicy, extraNotes):
            var params = ["customer_mobile":customerMobile, "due_date": dueDate] as [String : Any]
            var itemsArray = Array<Any>()
            for item in items {
                let itemDic = ["description": item.itemDescription, "name": item.itemnName, "price": item.itemPrice, "quantity": item.itemQuantity] as [String : Any]
                itemsArray.append(itemDic)
            }
            params["items"] = itemsArray
            if let unwrappedInvoicenumber = invoiceNumber {
                params["invoice_number"] = unwrappedInvoicenumber
            }
            if let unwrappedStatus = status {
                params["status"] = unwrappedStatus
            }
            if let unwrappedCreateDate = createDate {
                params["create_date"] = unwrappedCreateDate
            }
            if let unwrappedPrefPaymentMethod = prefPaymentMethod {
                params["pref_payment_method"] = unwrappedPrefPaymentMethod
            }
            if let unwrappedShippingFees = shippingFees {
                params["shipping_fees"] = unwrappedShippingFees
            }
            if let unwrappedDiscountValue = discountValue {
                params["discount_value"] = unwrappedDiscountValue
            }
            if let unwrappedDiscountType = discountType {
                params["discount_type"] = unwrappedDiscountType
            }
            if let unwrappedDiscountValueCalculated = discountValueCalculated {
                params["discount_value_calculated"] = unwrappedDiscountValueCalculated
            }
            if let unwrappedTax = tax {
                params["tax"] = unwrappedTax
            }
            if let unwrappedTaxValue = taxValue {
                params["tax_value"] = unwrappedTaxValue
            }
            if let unwrappedShippingPolicy = shippingPolicy {
                params["shipping_policy"] = unwrappedShippingPolicy
            }
            if let unwrappedReturnPolicy = returnPolicy {
                params["return_policy"] = unwrappedReturnPolicy
            }
            if let unwrappedExtraNotes = extraNotes {
                params["extra_notes"] = unwrappedExtraNotes
            }
            let totalParams = ["invoice":params]
            return .WithParametersRequest(parameters: totalParams, encoding: JSONEncoding.default)
        case .list:
            return .normalRequest
        case .get:
            return .normalRequest
        case .delete:
            return .normalRequest
        case let .pay(invoiceNumber, customerMobile, paymentMethodId):
            var params = ["invoice_number": invoiceNumber]
            if let unwrappedCustomerMobile = customerMobile {
                params["customer_mobile"] = unwrappedCustomerMobile
            }
            if let unwrappedPaymentMethodId = paymentMethodId {
                params["payment_method_id"] = unwrappedPaymentMethodId
            }
            return .WithParametersRequest(parameters: params, encoding: JSONEncoding.default)
        }
    }
}
