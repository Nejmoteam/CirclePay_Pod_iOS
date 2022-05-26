//
//  InvoiceFirstScreenPresenter.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class InvoiceFirstScreenPresenter: InvoiceFirstScreenPresenterProtocol, InvoiceFirstScreenInteractorOutPutProtocol {

    weak var view: InvoiceFirstScreenViewProtocol?
    private let interactor: InvoiceFirstScreenInteractorInPutProtocol
    private let router: InvoiceFirstScreenRouterProtocol
    var invoiceViewModel: InvoiceFirstScreenViewModel
    var customer: GetCustomerCodable?
    var subTotal:Double {
        return invoiceViewModel.getInvoiceSubTotal()
    }
    var discunt: Double {
        return invoiceViewModel.getDiscuntValue()
    }
    var tax: Double {
        return invoiceViewModel.getTax()
    }
    init(view: InvoiceFirstScreenViewProtocol, interactor: InvoiceFirstScreenInteractorInPutProtocol, router: InvoiceFirstScreenRouterProtocol, invoiceNumber: InvoiceFirstScreenViewModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.invoiceViewModel = invoiceNumber
    }
    func viewDidLoad() {
        print("ViewDidLoad")
        print(invoiceViewModel.invoiceDetails)
        print(invoiceViewModel.merchantDetails)
        CirclePay.customers.getCustomer(mobileNumber: invoiceViewModel.invoiceDetails.customerMobile ?? "") { customer, err in
            if err != nil {
                
            } else {
                self.customer = customer
                //Sammery
                self.view?.configurePaymentSummery(billedFrom: customer?.getFullName() ?? "", billedTo: self.invoiceViewModel.merchantDetails.businessName ?? "")
                
                //TOTAL
                self.view?.configureTotal(total: "\(self.invoiceViewModel.getTotal())")
                
                
                
                //SUBTOTAL
                self.view?.configureSubTotal(subTotal: "\(self.subTotal)")
                
                
                //TAX
                self.view?.configureTaxView(taxValue: "\(self.tax)", taxPersentage: "\((self.invoiceViewModel.invoiceDetails.tax ?? 0.0))")
//                self.setupTax()

                

                //Shipping
                self.view?.configureShipping(shippingValue: "\(self.invoiceViewModel.invoiceDetails.shippingFees ?? 0.0)")
                
                
                //DISCOUNT
                if self.invoiceViewModel.invoiceDetails.discountType == DiscountTypes.percentage.rawValue {
                    self.view?.configureDiscount(discountType: .percentage, discountValue: "\(self.invoiceViewModel.invoiceDetails.discountValue ?? 0.0)", value: "\(self.invoiceViewModel.getDiscuntValue())")
                } else {
                    self.view?.configureDiscount(discountType: .fixed, discountValue: "\(self.invoiceViewModel.invoiceDetails.discountValue ?? 0.0)", value: "\(self.invoiceViewModel.getDiscuntValue())")

                }
                
                
                
//                self.view?.configureDiscount(discountPercentage: "\(self.invoiceViewModel.invoiceDetails.discountValue ?? 0.0)", value: "\(self.discunt)")

                
                
                self.view?.configureInvoiceDate(date: self.invoiceViewModel.invoiceDetails.dueDate ?? "")
                
            }
        }


    }
    
    private func setupTax() {
        let taxValue = self.invoiceViewModel.invoiceDetails.taxValue ?? 0.0
        let taxValueString = "\(taxValue)"
        let taxPersentage = self.invoiceViewModel.invoiceDetails.tax ?? 0.0
        let taxPersentageString = "\(taxPersentage)"
        self.view?.configureTaxView(taxValue: taxValueString, taxPersentage: taxPersentageString)

    }
    
    
    func navigateToStepTwo() {
        if let unwrappedCustomer = customer {
            self.router.navigateToStepTwo(invoiceViewModel: self.invoiceViewModel, customer: unwrappedCustomer)

        }
    }
    
    func navigateToInvoiceDetails() {
        if let customer = self.customer {
            self.router.navigateToInvoiceDetails(invoiceViewModel: self.invoiceViewModel, customer: customer)
        }
    }
    
}
