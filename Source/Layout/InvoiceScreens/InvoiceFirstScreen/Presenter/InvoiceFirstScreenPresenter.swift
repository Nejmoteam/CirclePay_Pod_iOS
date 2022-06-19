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
    let interactor: InvoiceFirstScreenInteractorInPutProtocol
    let router: InvoiceFirstScreenRouterProtocol
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
        self.setupUIConfigs()
        CirclePay.customers.getCustomer(mobileNumber: invoiceViewModel.invoiceDetails.customerMobile ?? "") { customer, err in
            if let unwrappedError = err {
                CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: unwrappedError)
            } else {
                self.customer = customer
                self.configureViewData()
            }
        }
        
        
    }
    
    private func setupUIConfigs() {
        if let unwrappedConfigs = CirclePay.uiConfigs {
            if let unwrappedisLogoEnabled = unwrappedConfigs.logoEnable {
                self.view?.setupLogoConfigurations(isLogoEnabled: unwrappedisLogoEnabled, logoUrl: unwrappedConfigs.logo ?? "")
            }
            if let unwrappedColor = unwrappedConfigs.color {
                self.view?.setupPrimaryColorConfiguration(colorString: unwrappedColor)
            }
            if let unwrappedBilledFromEnabled = unwrappedConfigs.billedFromEnable {
                self.view?.setupBilledFromConfiguration(isEnabled: unwrappedBilledFromEnabled)
            }
            
            if let unwrappedBilledToEnabled = unwrappedConfigs.billToEnable {
                self.view?.setupBilledToConfiguration(isEnabled: unwrappedBilledToEnabled)
            }
            
            if let unwrappedTotalAmountisEnabled = unwrappedConfigs.totalPaymentEnable {
                self.view?.setupTotalAmountConfiguration(isEnabled: unwrappedTotalAmountisEnabled)
            }
            if let unwrappedAccountingEnabled = unwrappedConfigs.accountingEnable {
                self.view?.setupAccountingConfiguration(isEnabled: unwrappedAccountingEnabled)
            }
            
            if let unwrappedShippingPolicyIsEnabled = unwrappedConfigs.shippingPolicyEnable {
                self.view?.setupShippingPolicyConfiguration(isEnabled: unwrappedShippingPolicyIsEnabled)
            }
            
            if let unwrappedRefundPolicyIsEnabled = unwrappedConfigs.refundPolicyEnable {
                self.view?.setupRefundPolicyConfiguration(isEnabled: unwrappedRefundPolicyIsEnabled)
            }
        }
    }
    
    func configureViewData() {
        //Sammery
        self.view?.configurePaymentSummery(billedFrom: customer?.getFullName() ?? "", billedTo: self.invoiceViewModel.merchantDetails.businessName ?? "")
        //TOTAL
        self.view?.configureTotal(total: "\(self.invoiceViewModel.getTotal())")
        //SUBTOTAL
        self.view?.configureSubTotal(subTotal: "\(self.subTotal)")
        //TAX
        self.view?.configureTaxView(taxValue: "\(self.tax)", taxPersentage: "\((self.invoiceViewModel.invoiceDetails.tax ?? 0.0))")
        //Shipping
        self.view?.configureShipping(shippingValue: "\(self.invoiceViewModel.invoiceDetails.shippingFees ?? 0.0)")
        //DISCOUNT
        if self.invoiceViewModel.invoiceDetails.discountType == DiscountTypes.percentage.rawValue {
            self.view?.configureDiscount(discountType: .percentage, discountValue: "\(self.invoiceViewModel.invoiceDetails.discountValue ?? 0.0)", value: "\(self.invoiceViewModel.getDiscuntValue())")
        } else {
            self.view?.configureDiscount(discountType: .fixed, discountValue: "\(self.invoiceViewModel.invoiceDetails.discountValue ?? 0.0)", value: "\(self.invoiceViewModel.getDiscuntValue())")
        }
        //DATE
        self.setupInvoiceDate()
    }
    
    private func setupInvoiceDate() {
        let dateString = self.invoiceViewModel.invoiceDetails.dueDate ?? ""
        let dateStringFormated = dateString.toDate(format: .isoDateTimeMilliSec)?.toString(format: .custom("dd-MM-yyyy"))
        self.view?.configureInvoiceDate(date: dateStringFormated ?? "")
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
    func navigateToShippingPolicy() {
        
        self.router.navigateToShippingPolicy(shippingPolicy: self.invoiceViewModel.invoiceDetails.shippingPolicy ?? "")
    }
    
    func navigateToRefundPolicy() {
        self.router.navigateToRefundPolicy(refundPolicy: self.invoiceViewModel.invoiceDetails.returnPolicy ?? "")
    }
    
    func dismiss() {
        self.router.dismiss()
    }
    
    
}
