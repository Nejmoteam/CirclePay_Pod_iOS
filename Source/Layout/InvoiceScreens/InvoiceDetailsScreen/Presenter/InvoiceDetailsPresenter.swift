//
//  InvoiceDetailsPresenter.swift
//  Pods
//
//  Created apple on 25/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class InvoiceDetailsPresenter: InvoiceDetailsPresenterProtocol, InvoiceDetailsInteractorOutPutProtocol {
    weak var view: InvoiceDetailsViewProtocol?
    private let interactor: InvoiceDetailsInteractorInPutProtocol
    private let router: InvoiceDetailsRouterProtocol
    var invoiceViewModel: InvoiceFirstScreenViewModel
    var customer: GetCustomerCodable
    init(view: InvoiceDetailsViewProtocol, interactor: InvoiceDetailsInteractorInPutProtocol, router: InvoiceDetailsRouterProtocol,invoiceViewModel: InvoiceFirstScreenViewModel, customer: GetCustomerCodable) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.invoiceViewModel = invoiceViewModel
        self.customer = customer
    }
    
    func viewDidLoad() {
        print("ViewDidLoad")

    }
    
    func dismissView() {
        router.dismissView()
    }
}
