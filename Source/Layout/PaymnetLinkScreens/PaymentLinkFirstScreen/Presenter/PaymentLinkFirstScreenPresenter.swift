//
//  PaymentLinkFirstScreenPresenter.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class PaymentLinkFirstScreenPresenter: PaymentLinkFirstScreenPresenterProtocol, PaymentLinkFirstScreenInteractorOutPutProtocol {
    weak var view: PaymentLinkFirstScreenViewProtocol?
    private let interactor: PaymentLinkFirstScreenInteractorInPutProtocol
    private let router: PaymentLinkFirstScreenRouterProtocol
    init(view: PaymentLinkFirstScreenViewProtocol, interactor: PaymentLinkFirstScreenInteractorInPutProtocol, router: PaymentLinkFirstScreenRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        print("ViewDidLoad")

    }
    
    func navigateToStepTwo() {
        self.router.navigateToStepTwo()
    }
}
