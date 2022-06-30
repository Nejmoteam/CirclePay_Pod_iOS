//
//  InvoiceSecondScreenPresenterTests.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by Alchemist on 30/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
@testable import CirclePay_Pod_iOS
class InvoiceSecondScreenPresenterTests: XCTestCase {
    var sut : InvoiceSecondScreenPresenter?
    var mockView: InvoiceSecondScreenViewController?
    var mockInteractor: InvoiceSecondScreenInteractor?
    var mockRouter: InvoiceSecondScreenRouter?
    var mockInvoiceFirstScreenVM: InvoiceFirstScreenViewModelMock?
    /* We need to do a lot of setup here to make sure all
     out dependcies are loaded before the tests are run.*/
    override func setUp() {
        
        mockView = InvoiceSecondScreenViewController()
        mockInteractor = InvoiceSecondScreenInteractor()
        mockRouter = InvoiceSecondScreenRouter()
        mockInvoiceFirstScreenVM = InvoiceFirstScreenViewModelMock()

        sut = InvoiceSecondScreenPresenter(view: mockView!, interactor: mockInteractor!, router: mockRouter!, invoiceViewModel: (mockInvoiceFirstScreenVM?.getMockVm())!, customer: (mockInvoiceFirstScreenVM?.getInvoiceCustomer())!)
        mockView!.presenter = sut
        mockInteractor!.presenter = sut
        mockRouter!.viewController = mockView
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        mockInvoiceFirstScreenVM = nil
        super.tearDown()
    }
    
    func test_payment_method() {
        let methods : [MerchantPaymentMethodsMobile] = [MerchantPaymentMethodsMobile(id: "", name: "Method 1", gatewayID: "", status: true, rateObject: nil, paymentGatewayName: "Getway 1", paymentMethodURL: "imageUrl")]
        mockInteractor?.presenter?.fetchedPaymentMethodsSucsesfully(methods: methods)
        
        wait(interval: 0.00020) {
            XCTAssert(self.sut?.methodsViewModel != nil)
            XCTAssert(self.sut?.methodsViewModel.count == 1)
            XCTAssert(self.sut?.methodsViewModel[0].paymentMethodName == "Method 1")
        }
    }
    
    func test_numberofmethods_count() {
        let methods : [MerchantPaymentMethodsMobile] = [MerchantPaymentMethodsMobile(id: "", name: "Method 1", gatewayID: "", status: true, rateObject: nil, paymentGatewayName: "Getway 1", paymentMethodURL: "imageUrl")]
        mockInteractor?.presenter?.fetchedPaymentMethodsSucsesfully(methods: methods)
        
        wait(interval: 0.00020) {
            XCTAssert(self.sut?.numberOfPaymentMethods() == 1)
        }

    }
    
    func test_numberofmethods_tablereflection() {
        let methods : [MerchantPaymentMethodsMobile] = [MerchantPaymentMethodsMobile(id: "", name: "Method 1", gatewayID: "", status: true, rateObject: nil, paymentGatewayName: "Getway 1", paymentMethodURL: "imageUrl")]
        mockInteractor?.presenter?.fetchedPaymentMethodsSucsesfully(methods: methods)
        
        wait(interval: 0.1) {
            XCTAssert(self.mockView?.containerView.paymentMethodsView.tableView.numberOfRows(inSection: 0) == 1)
        }
    }
    
    func test_paymentmethod_selction() {
        let methods : [MerchantPaymentMethodsMobile] = [
            MerchantPaymentMethodsMobile(id: "", name: "Method 1", gatewayID: "", status: true, rateObject: nil, paymentGatewayName: "Getway 1", paymentMethodURL: "imageUrl 1"),
            MerchantPaymentMethodsMobile(id: "", name: "Method 2", gatewayID: "", status: true, rateObject: nil, paymentGatewayName: "Getway 2", paymentMethodURL: "imageUrl 2")
        ]
        mockInteractor?.presenter?.fetchedPaymentMethodsSucsesfully(methods: methods)
        mockView?.presenter.didSelectPaymentMethod(at: IndexPath(row: 1, section: 0))
        
        wait(interval: 0.1) {
            XCTAssert(self.sut?.selectedPaymentMethod != nil)
            XCTAssert(self.sut?.selectedPaymentMethod?.paymentMethodName == "Method 2")

        }
    }
    
    func test_didchange_country() {
        mockView?.presenter.didChangeCountry(countryName: "New Country Name")
        wait(interval: 0.1) {
            XCTAssert(self.sut?.newCountry == "New Country Name")
        }
    }
    
    func test_on_tap_pay() {
        sut?.onTapPay()
        wait(interval: 0.1) {
            XCTAssert(self.mockView?.containerView.payButtonContainer.nextButton.isEnabled == false)
        }
    }
    
    func test_disable_pay_button() {

        sut?.view?.disablePayButton()
        wait(interval: 0.1) {
            XCTAssert(self.mockView?.containerView.payButtonContainer.nextButton.isEnabled == false)
        }
    }
    
    func test_enable_pay_button() {

        sut?.view?.enablePayButton()
        wait(interval: 0.1) {
            XCTAssert(self.mockView?.containerView.payButtonContainer.nextButton.isEnabled == true)
        }
    }
    
    func test_logo_configuration() {
        sut?.view?.setupLogoConfigurations(isLogoEnabled: false, logoUrl: "")
        wait(interval: 0.0001) {
            XCTAssertTrue(((self.mockView?.containerView.logoView.isHidden) != nil))
            XCTAssert(self.mockView?.containerView.logoView.isHidden == true)
        }
    }

}
