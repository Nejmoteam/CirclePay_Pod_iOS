//
//  InvoiceSecondScreenPresenter.swift
//  Pods
//
//  Created Alchemist on 24/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class InvoiceSecondScreenPresenter: InvoiceSecondScreenPresenterProtocol, InvoiceSecondScreenInteractorOutPutProtocol {
    
    weak var view: InvoiceSecondScreenViewProtocol?
    private let interactor: InvoiceSecondScreenInteractorInPutProtocol
    private let router: InvoiceSecondScreenRouterProtocol
    var invoiceViewModel: InvoiceFirstScreenViewModel
    var customer: GetCustomerCodable
    var methodsViewModel = [PaymentMethodsViewModel]()
    var selectedPaymentMethod: PaymentMethodsViewModel?
    
    var invoiceNumber: String {
        return self.invoiceViewModel.invoiceDetails.invoiceNumber ?? ""
    }
    var customerNumber: String {
        return self.invoiceViewModel.invoiceDetails.customerMobile ?? ""
    }
    init(view: InvoiceSecondScreenViewProtocol, interactor: InvoiceSecondScreenInteractorInPutProtocol, router: InvoiceSecondScreenRouterProtocol, invoiceViewModel: InvoiceFirstScreenViewModel, customer: GetCustomerCodable) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.invoiceViewModel = invoiceViewModel
        self.customer = customer
    }
    func viewDidLoad() {
        print("ViewDidLoad")
        self.getPaymentMethods()
        
    }
    
    func numberOfPaymentMethods() -> Int {
        return self.methodsViewModel.count
    }
    
    func configurePaymentMethodsCell(cell: PaymentMethodsCellView, indexPath: IndexPath) {
        guard self.methodsViewModel.count > 0 else {
            return
        }
        cell.setData(paymentMethod: self.methodsViewModel[indexPath.item])
    }
    
    func didSelectPaymentMethod(at indexPath: IndexPath) {
        guard self.methodsViewModel.count > 0 else {
            return
        }
        self.selectedPaymentMethod = self.methodsViewModel[indexPath.item]
        print(selectedPaymentMethod)
    }
    
    func onTapPay() {
        guard self.selectedPaymentMethod != nil else {
            //Show error
            return
        }
        self.payInvoice()
        
    }
    
    func getPaymentMethods() {
        CirclePay.merchants.listPaymentGateways { paymenGetways, err in
            if err == nil {
                CirclePay.merchants.listPaymentMethods { merchantPaymentMethods, err in
                    if err == nil {
                        
                        merchantPaymentMethods?.forEach({ method in
                            let name = paymenGetways?.filter({$0.id == method.gateWayId}).first?.name
                            self.methodsViewModel.append(PaymentMethodsViewModel(paymentMethodId: method.id ?? "", paymentMethodName: method.name ?? "", paymentGetwayId: method.gateWayId ?? "", paymentGetwayName: name ?? ""))
                        })
                        self.view?.reloadPaymentMethodsData()
                        //Reload TableView
                        self.methodsViewModel.forEach({print($0.paymentMethodName , " By: " , $0.paymentGetwayName)})
                    }
                }
            }
        }
    }
    
    func payInvoice() {
        CirclePay.invoices.payInvoice(invoiceNumber: self.invoiceNumber, customerMobile: self.customerNumber, paymentMethodId: self.selectedPaymentMethod?.paymentMethodId) { invoiceData, err in
            if err == nil {
                let url = invoiceData?.invoiceUrl
                print(url)
                //Open with webView
            } else {
                
            }
        }
    }
}
