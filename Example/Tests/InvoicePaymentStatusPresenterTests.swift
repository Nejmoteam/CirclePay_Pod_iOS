//
//  InvoicePaymentStatusPresenterTests.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by Alchemist on 30/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
@testable import CirclePay_Pod_iOS
class InvoicePaymentStatusPresenterTests: XCTestCase {
    var sut : InvoicePaymentStatusPresenter?
    var mockView: InvoicePaymentStatusViewController?
    var mockInteractor: InvoicePaymentStatusInteractor?
    var mockRouter: InvoicePaymentStatusRouter?
    var mockInvoiceFirstScreenVM: InvoiceFirstScreenViewModelMock?
    /* We need to do a lot of setup here to make sure all
     out dependcies are loaded before the tests are run.*/
    override func setUp() {
        
        mockView = InvoicePaymentStatusViewController()
        mockInteractor = InvoicePaymentStatusInteractor()
        mockRouter = InvoicePaymentStatusRouter()
        mockInvoiceFirstScreenVM = InvoiceFirstScreenViewModelMock()
        sut = InvoicePaymentStatusPresenter(view: self.mockView!, interactor: self.mockInteractor!, router: self.mockRouter!, status: .success, invoiceViewModel: (mockInvoiceFirstScreenVM?.getMockVm())!)
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
    
    func test_setup_views_in_sucsess() {
        sut?.view?.setupView(with: .success)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.titleLabel.text == "Transaction Paid successfully.")
            XCTAssert(self.mockView?.containerView.subTitleLabel.isHidden == true)
            XCTAssert(self.mockView?.containerView.inoviceDetailsButton.isHidden == false)
            XCTAssert(self.mockView?.containerView.emptyView.isHidden == false)
            XCTAssert(self.mockView?.containerView.invoiceNumberView.isHidden == false)
            XCTAssert(self.mockView?.containerView.paymentDateView.isHidden == false)
            XCTAssert(self.mockView?.containerView.downloadButton.isHidden == false)
            XCTAssert(self.mockView?.containerView.dismissButton.isHidden == false)
            XCTAssert(self.mockView?.containerView.tryAgainButton.isHidden == true)
        }
    }
    
    func test_setup_views_in_paid() {
        sut?.view?.setupView(with: .paid)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.titleLabel.text == "Transaction Paid successfully.")
            XCTAssert(self.mockView?.containerView.subTitleLabel.isHidden == true)
            XCTAssert(self.mockView?.containerView.inoviceDetailsButton.isHidden == false)
            XCTAssert(self.mockView?.containerView.emptyView.isHidden == false)
            XCTAssert(self.mockView?.containerView.invoiceNumberView.isHidden == false)
            XCTAssert(self.mockView?.containerView.paymentDateView.isHidden == false)
            XCTAssert(self.mockView?.containerView.downloadButton.isHidden == false)
            XCTAssert(self.mockView?.containerView.dismissButton.isHidden == false)
            XCTAssert(self.mockView?.containerView.tryAgainButton.isHidden == true)
        }

    }
    
    func test_setup_views_in_notAvailable() {
        sut?.view?.setupView(with: .notAvailable)
        
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.titleLabel.text == "Invoice is not available!")
            XCTAssert(self.mockView?.containerView.subTitleLabel.text == "The invoice is no longer exist it may be expired or turned off.")
            XCTAssert(self.mockView?.containerView.subTitleLabel.isHidden == false)
            XCTAssert(self.mockView?.containerView.inoviceDetailsButton.isHidden == true)
            XCTAssert(self.mockView?.containerView.emptyView.isHidden == true)
            XCTAssert(self.mockView?.containerView.invoiceNumberView.isHidden == true)
            XCTAssert(self.mockView?.containerView.paymentDateView.isHidden == true)
            XCTAssert(self.mockView?.containerView.downloadButton.isHidden == true)
            XCTAssert(self.mockView?.containerView.dismissButton.isHidden == false)
            XCTAssert(self.mockView?.containerView.tryAgainButton.isHidden == true)
        }

    }
    
    func test_setup_views_in_Failuer() {
        sut?.view?.setupView(with: .failure)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.titleLabel.text == "Transaction Failed")
            XCTAssert(self.mockView?.containerView.subTitleLabel.text == "You can try again or contact the merchant for any further requests.")
            XCTAssert(self.mockView?.containerView.subTitleLabel.isHidden == false)
            XCTAssert(self.mockView?.containerView.inoviceDetailsButton.isHidden == true)
            XCTAssert(self.mockView?.containerView.emptyView.isHidden == true)
            XCTAssert(self.mockView?.containerView.invoiceNumberView.isHidden == true)
            XCTAssert(self.mockView?.containerView.paymentDateView.isHidden == true)
            XCTAssert(self.mockView?.containerView.downloadButton.isHidden == true)
            XCTAssert(self.mockView?.containerView.dismissButton.isHidden == true)
            XCTAssert(self.mockView?.containerView.tryAgainButton.isHidden == false)
        }
    }
    
    func test_invoice_number() {
        sut?.view?.setInvoiceNumber(value: "Invoice Number")
        wait(interval: 0.0001) {
            XCTAssert(           self.mockView?.containerView.invoiceNumberView.valueLabel.text == "Invoice Number")
        }
    }
    
    func test_setup_invoice_date() {
        sut?.view?.setInvoicePaymentDate(value:  Date().toString(format: .isoDate))
        wait(interval: 0.0001) {
            XCTAssert(           self.mockView?.containerView.paymentDateView.valueLabel.text == Date().toString(format: .isoDate))
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
