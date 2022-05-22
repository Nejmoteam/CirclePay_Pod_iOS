//
//  PaymentLinkSecondScreenPresenter.swift
//  Pods
//
//  Created Alchemist on 22/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class PaymentLinkSecondScreenPresenter: PaymentLinkSecondScreenPresenterProtocol, PaymentLinkSecondScreenInteractorOutPutProtocol {
    weak var view: PaymentLinkSecondScreenViewProtocol?
    private let interactor: PaymentLinkSecondScreenInteractorInPutProtocol
    private let router: PaymentLinkSecondScreenRouterProtocol
    init(view: PaymentLinkSecondScreenViewProtocol, interactor: PaymentLinkSecondScreenInteractorInPutProtocol, router: PaymentLinkSecondScreenRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        print("ViewDidLoad")

    }
}
