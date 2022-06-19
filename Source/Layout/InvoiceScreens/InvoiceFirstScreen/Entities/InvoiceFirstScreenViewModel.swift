//
//  InvoiceFirstScreenViewModel.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 23/05/2022.
//

import Foundation
struct InvoiceFirstScreenViewModel {
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
            if let discountValue = invoiceDetails.discountValue {
                if discountType  == "percentage" {
                    let discountInDouble = (discountValue / 100) * self.getInvoiceSubTotal()
                    return discountInDouble
                } else {
                    return discountValue
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
            let taxDigitEnhanced = Double(round(10 * finalTaxAmount) / 10)

            return taxDigitEnhanced
        } else {
            return 0.0
        }
    }
    
    func getTotal() -> Double {
        let subTotal = self.getInvoiceSubTotal()
        let tax = self.getTax()
        let discount = self.getDiscuntValue()
        let shipping = self.invoiceDetails.shippingFees ?? 0.0
        let totalBeforeDiscount = subTotal + tax + shipping

        let total = totalBeforeDiscount - discount
        let totalDigitEnhanced = Double(round(10 * total) / 10)
        return Double(totalDigitEnhanced)
    }
}
