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
    
    func configureCell(cell: InvoiceDetailsPaymentSammaryTableViewCellView) {
        cell.configurePaymentSummery(billedFrom: customer.getFullName(), billedTo: invoiceViewModel.merchantDetails.businessName ?? "")
        cell.configureTaxView(taxValue: "\(self.invoiceViewModel.invoiceDetails.taxValue ?? 0.0)", taxPersentage: "\(self.invoiceViewModel.invoiceDetails.tax ?? 0.0)")
        cell.configureShipping(shippingValue: "\(invoiceViewModel.invoiceDetails.shippingFees ?? 0.0)")
        cell.configureDiscount(discountType: .percentage, discountValue:"\(self.invoiceViewModel.invoiceDetails.discountValueCalculated ?? 0.0)", value: "\(self.invoiceViewModel.invoiceDetails.discountValue ?? 0.0)")
        cell.configureSubTotal(subTotal: "\(self.invoiceViewModel.getInvoiceSubTotal())")
        cell.configureTotal(total: "\(invoiceViewModel.getTotal())")
    }
    
    func configureCell(cell: InvoiceDetailsProductTableViewCellView, at indexPath: IndexPath) {
        guard let items = invoiceViewModel.invoiceDetails.items, !items.isEmpty, indexPath.item < items.count else {
            return
        }
        cell.configCell(product: items[indexPath.item])
    }
    
}
