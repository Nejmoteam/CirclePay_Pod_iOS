//
//  InvoiceFirstScreenPresenterTests.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by Alchemist on 19/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
@testable import CirclePay_Pod_iOS
import XCTest

class InvoiceFirstScreenPresenterTests: XCTestCase {
    
    var sut : InvoiceFirstScreenPresenter?
    var mockView: InvoiceFirstScreenViewController?
    var mockInteractor: InvoiceFirstScreenInteractor?
    var mockRouter: InvoiceFirstScreenRouter?
    var mockInvoiceFirstScreenVM: InvoiceFirstScreenViewModelMock?
    /* We need to do a lot of setup here to make sure all
     out dependcies are loaded before the tests are run.*/
    override func setUp() {
        
        mockView = InvoiceFirstScreenViewController()
        mockInteractor = InvoiceFirstScreenInteractor()
        mockRouter = InvoiceFirstScreenRouter()
        mockInvoiceFirstScreenVM = InvoiceFirstScreenViewModelMock()
        sut = InvoiceFirstScreenPresenter(view: mockView!, interactor: mockInteractor!, router: mockRouter!, invoiceNumber: (mockInvoiceFirstScreenVM?.getMockVm())!)
        mockView!.presenter = sut
        mockInteractor!.presenter = sut
        mockRouter!.viewController = mockView
        sut?.customer = mockInvoiceFirstScreenVM?.getInvoiceCustomer()
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
    
    func testingTotalAmmont() {
        let total = sut?.invoiceViewModel.getTotal()
        XCTAssertNotNil(total)
        XCTAssertEqual(total, 700)
    }
    
    func testBilledFrom() {
        sut?.configureViewData()
        wait(interval: 0.0001) {
            XCTAssertEqual(self.mockView?.containerView.billedFromView.valueLabel.text, "Allam Allam")

        }
    }
    
    
}

class InvoiceFirstScreenViewModelMock{
    func getMockVm() -> InvoiceFirstScreenViewModel {
        let item1 = InvoiceItemsCodable(name: "First Item", description: "First Item Desc", quantity: 200, price: 2)
        let item2 = InvoiceItemsCodable(name: "Second Item", description: "Second Item Desc", quantity: 100, price: 3)
        let invDetailsMock = InvoiceCodable(invoiceNumber: "1234", items: [item1, item2
        ], customerMobile: "+201061140960", status: 0, createDate: "", dueDate: "", prefPaymenMethod: "", shippingFees: 0.0, discountValue: 0.0, discountType: "", discountValueCalculated: 0.0, tax: 0.0, taxValue: 0.0, shippingPolicy:"", returnPolicy: "", extraNotes: "", totalValue: 0.0, subTotalValue: 0.0)
        let merchantDetailsMock = MerchantCodable(firstName: "Mahmoud", lastName: "Allam", email: "allam40960@gmail.com", mobileNumber: "+201157818027", businessName: "EGiant", businessAddress: "", refundPolicy: "Refund", shippingPolicy: "Shippint", status: "", merchantToken: "")
        
        return InvoiceFirstScreenViewModel(invoiceDetails: invDetailsMock, merchantDetails: merchantDetailsMock)
    }
    
    func getInvoiceCustomer() -> GetCustomerCodable {
        return GetCustomerCodable(firstName: "Allam", lastName: "Allam", email: "mahmoudallam@circlepay.ai", mobileNumber: "+201061140960", country: "Egypt", governorate: "A", city: "Cairo", address: "_", aptNumber: "123")
    }
}

extension XCTestCase {
    func wait(interval: TimeInterval = 0.1 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1) // add 0.1 for sure asyn after called
    }
}
