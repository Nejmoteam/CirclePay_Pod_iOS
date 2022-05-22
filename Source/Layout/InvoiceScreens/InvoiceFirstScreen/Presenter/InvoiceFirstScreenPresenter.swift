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
    init(view: InvoiceFirstScreenViewProtocol, interactor: InvoiceFirstScreenInteractorInPutProtocol, router: InvoiceFirstScreenRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        print("ViewDidLoad")

    }
}
