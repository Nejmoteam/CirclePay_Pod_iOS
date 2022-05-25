//
//  InvoiceFirstScreenViewModel.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 23/05/2022.
//

import Foundation
public struct InvoiceFirstScreenViewModel {
    public var invoiceDetails :InvoiceCodable
    public var merchantDetails: MerchantCodable
    
    func getInvoiceSubTotal() -> Double {
        var subTotal : Double = 0.0
        if let items =  invoiceDetails.items {
            items.forEach({subTotal += $0.getPrice()})
        }
        return subTotal
    }
    
    func getDiscuntValue() -> Double {
        if let discountType = invoiceDetails.discountType {
            if discountType  == "Percentage" {
                if let discountValue = invoiceDetails.discountValue {
                    let discountInDouble = (discountValue / 100) * self.getInvoiceSubTotal()
                    return discountInDouble
                } else {
                    return 0.0
                }
            } else {
                return 0.0
            }
        } else {
            return 0.0
        }
    }
    
    func getTax() -> Double {
        let subTotal = self.getInvoiceSubTotal()
        let discount = self.getDiscuntValue()
        let amountBeforeTax = subTotal - discount
        if let tax = self.invoiceDetails.tax  {
            let finalTaxAmount = (tax / 100) * amountBeforeTax
            return finalTaxAmount
        } else {
            return 0.0
        }
    }
}
