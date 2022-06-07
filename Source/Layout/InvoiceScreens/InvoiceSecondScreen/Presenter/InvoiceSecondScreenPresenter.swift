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
    var updatedCustomerData: GetCustomerCodable?
    var methodsViewModel = [PaymentMethodsViewModel]()
    var selectedPaymentMethod: PaymentMethodsViewModel?
    
    var newCountry:String?
    
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
        self.setupUIConfigs()
        self.getPaymentMethods()
        var customerPhone = ""
        if let unwrappedPhone = customer.mobileNumber {
            customerPhone = unwrappedPhone
            while customerPhone.first != "1" && !customerPhone.isEmpty{
                customerPhone = String(customerPhone.dropFirst())
            }
            print(unwrappedPhone)
            print(customerPhone)
        }
        let customerView = CustomerViewModel(firstName: customer.firstName ?? "", lastName: customer.lastName ?? "", countryCode: "🇪🇬  +20", phoneNumber: customerPhone, email: customer.email ?? "", country: customer.country ?? "Egypt", city: customer.city ?? "", aptNumber: customer.aptNumber ?? "", extraDetails: customer.address ?? "")
        self.view?.setupCustomerData(customer: customerView)
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
        self.view?.enablePayButton()
    }
    
    func onTapPay() {
        self.updatedCustomerData?.mobileNumber = self.customer.mobileNumber
        self.updatedCustomerData?.governorate = self.customer.governorate
        guard self.selectedPaymentMethod != nil , self.updatedCustomerData?.mobileNumber != nil else {
            //Show error
            return
        }
        self.view?.showLoadingForPayButton()
        self.view?.disablePayButton()
        // pay invoice , update customer
        self.handleTappingOnPayButton()
        
    }
    
    func didChangeCountry(countryName: String) {
        self.newCountry = countryName
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
    
    private func handleTappingOnPayButton() {
        let dispatchGroup = DispatchGroup()
        var iframeURL  = ""
        var transactionID = ""
        dispatchGroup.enter()
        CirclePay.customers.updateCustomer(firstName: self.updatedCustomerData?.firstName ?? "", lastName: self.updatedCustomerData?.lastName ?? "", address: self.updatedCustomerData?.address ?? "", country: self.updatedCustomerData?.country ?? "", governorate: self.updatedCustomerData?.governorate ?? "", city: self.updatedCustomerData?.city ?? "", aptNumber: self.updatedCustomerData?.aptNumber ?? "", email: self.updatedCustomerData?.email ?? "", mobileNumber: self.updatedCustomerData?.mobileNumber ?? "") { customerData, error in
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        CirclePay.invoices.payInvoice(invoiceNumber: self.invoiceNumber, customerMobile: self.customerNumber, paymentMethodId: self.selectedPaymentMethod?.paymentMethodId) { invoiceData, err in
            if let unwrappedError = err {
                CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: unwrappedError)
                self.view?.hideLoadingForPayButton()
                dispatchGroup.leave()
            } else {
                let url = invoiceData?.invoiceUrl
                let transactionId = invoiceData?.transactionId
                iframeURL = url ?? ""
                transactionID = transactionId ?? ""
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            guard iframeURL != "" && transactionID != "" else {
                return
            }
            // OPEN WEB VIEW WITH IFRAME URL
            self.view?.hideLoadingForPayButton()
            self.view?.enablePayButton()
            self.router.navigateToWebView(webViewUrl: iframeURL, transactionId: transactionID)
           // self.view?.openIframeViaSafari(iframeUrl: iframeURL)
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
        }
    }
    
    func dismiss() {
        self.router.dismiss()
    }
}

