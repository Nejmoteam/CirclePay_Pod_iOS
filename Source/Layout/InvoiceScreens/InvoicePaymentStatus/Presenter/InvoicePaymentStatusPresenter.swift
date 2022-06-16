//
//  InvoicePaymentStatusPresenter.swift
//  Pods
//
//  Created apple on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class InvoicePaymentStatusPresenter: InvoicePaymentStatusPresenterProtocol, InvoicePaymentStatusInteractorOutPutProtocol {
    weak var view: InvoicePaymentStatusViewProtocol?
    private let interactor: InvoicePaymentStatusInteractorInPutProtocol
    private let router: InvoicePaymentStatusRouterProtocol
    private var status:InvoicePaymentStatus = .success
    private var invoiceViewModel: InvoiceFirstScreenViewModel
    private var customer: GetCustomerCodable?
    init(view: InvoicePaymentStatusViewProtocol, interactor: InvoicePaymentStatusInteractorInPutProtocol, router: InvoicePaymentStatusRouterProtocol, status:InvoicePaymentStatus,invoiceViewModel: InvoiceFirstScreenViewModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.status = status
        self.invoiceViewModel = invoiceViewModel
    }
    
    func viewDidLoad() {
        print("ViewDidLoad")
        self.view?.setupView(with: self.status)
        self.setupUIConfigs()
        CirclePay.customers.getCustomer(mobileNumber: invoiceViewModel.invoiceDetails.customerMobile ?? "") { customer, err in
            if let unwrappedCustomer = customer {
                self.customer = unwrappedCustomer
            }
        }
        self.view?.setInvoiceNumber(value: self.invoiceViewModel.invoiceDetails.invoiceNumber ?? "")
        self.view?.setInvoicePaymentDate(value: Date().toString(format: .isoDate))
    }
    
    func userPressedViewInvoiceDetails() {
        print("View details")
        if let unwrappedCustomer = self.customer {
            self.router.navigateToInvoiceDetails(invoiceViewModel: self.invoiceViewModel, customer: unwrappedCustomer)
        }
    }
    
    private func setupUIConfigs() {
        if let unwrappedConfigs = CirclePay.uiConfigs {
            if let unwrappedisLogoEnabled = unwrappedConfigs.logoEnable {
                self.view?.setupLogoConfigurations(isLogoEnabled: unwrappedisLogoEnabled, logoUrl: unwrappedConfigs.logo ?? "")
            }
            if let unwrappedColor = unwrappedConfigs.color {
                self.view?.configureColor(stringColor: unwrappedColor)
            }
        }
    }
    
    func userPressedDownload() {
        print("Download")
    }
    
    func userPressedTryAgain() {
        print("try again")
        self.router.navigateToStepOneScreen(invoiceViewModel: self.invoiceViewModel)
    }
    
    func userPressedDismiss() {
        router.dismissView()
    }
}
