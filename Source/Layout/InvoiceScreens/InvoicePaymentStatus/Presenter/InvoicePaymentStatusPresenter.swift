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
    init(view: InvoicePaymentStatusViewProtocol, interactor: InvoicePaymentStatusInteractorInPutProtocol, router: InvoicePaymentStatusRouterProtocol, status:InvoicePaymentStatus,invoiceViewModel: InvoiceFirstScreenViewModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.status = status
        self.invoiceViewModel = invoiceViewModel
    }
    
    
    func setupDownloadInvoiceConfigs() {
        if let uiConfig = CirclePay.uiConfigs {
           if let pdfDownload = uiConfig.invoicePDFEnable {
                
            }
        }
    }
    func viewDidLoad() {
        print("ViewDidLoad")
        self.view?.setupView(with: self.status)
        self.view?.setInvoiceNumber(value: "34565767888")
        self.view?.setInvoicePaymentDate(value: "17 Apr 2022")
    }
    
    func userPressedViewInvoiceDetails() {
        print("View details")
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
