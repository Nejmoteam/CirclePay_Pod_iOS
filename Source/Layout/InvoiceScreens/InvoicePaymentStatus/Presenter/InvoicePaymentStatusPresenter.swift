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
    
    init(view: InvoicePaymentStatusViewProtocol, interactor: InvoicePaymentStatusInteractorInPutProtocol, router: InvoicePaymentStatusRouterProtocol, status:InvoicePaymentStatus) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.status = status
    }
    
    func viewDidLoad() {
        print("ViewDidLoad")
        self.view?.setupView(with: self.status)
        self.view?.setInvoiceNumber(value: "34565767888")
        self.view?.setInvoicePaymentDate(value: "17 Apr 2022")
        self.setupUIConfigs()
    }
    
    private func setupUIConfigs() {
        if let unwrappedConfigs = CirclePay.uiConfigs {
            if let unwrappedisLogoEnabled = unwrappedConfigs.logoEnable {
                self.view?.setupLogoConfigurations(isLogoEnabled: unwrappedisLogoEnabled, logoUrl: unwrappedConfigs.logo ?? "")
            }
            if let unwrappedColor = unwrappedConfigs.color {
                self.view?.setupPrimaryColorConfiguration(colorString: unwrappedColor)
            }
        }
    }
    
    func userPressedViewInvoiceDetails() {
        print("View details")
    }
    
    func userPressedDownload() {
        print("Download")
    }
    
    func userPressedTryAgain() {
        print("try again")
    }
    
    func userPressedDismiss() {
        router.dismissView()
    }
}
