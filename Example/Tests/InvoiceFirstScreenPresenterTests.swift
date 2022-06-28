//
//  InvoiceFirstScreenPresenterTests.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by Alchemist on 26/06/2022.
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
    
    func test_summary_info() {
        sut?.view?.configurePaymentSummery(billedFrom: sut?.customer?.getFullName() ?? "", billedTo: sut?.invoiceViewModel.merchantDetails.businessName ?? "")
        wait(interval: 0.0001) {
            XCTAssertEqual(self.mockView?.containerView.billedFromView.valueLabel.text, "Allam Allam")
            XCTAssertEqual(self.mockView?.containerView.billedToView.valueLabel.text, "EGiant")
        }
    }
    
    func test_tax() {
        sut?.view?.configureTaxView(taxValue: "\(String(describing: sut?.tax ?? 0.0))", taxPersentage: "\((sut?.invoiceViewModel.invoiceDetails.tax ?? 0.0))")
        wait(interval: 0.0001) {
            XCTAssertEqual(self.mockView?.containerView.taxView.valueLabel.text, "0.0 EGP")
        }
    }
    
    func test_shipping_policy() {
        sut?.view?.configureShipping(shippingValue: "\(sut?.invoiceViewModel.invoiceDetails.shippingFees ?? 0.0)")
        wait(interval: 0.0001) {
            XCTAssertEqual(self.mockView?.containerView.shippingView.valueLabel.text, "10.0 EGP")
        }
    }
    
    func test_discount() {
        if sut?.invoiceViewModel.invoiceDetails.discountType == DiscountTypes.percentage.rawValue {
            sut?.view?.configureDiscount(discountType: .percentage, discountValue: "\(sut?.invoiceViewModel.invoiceDetails.discountValue ?? 0.0)", value: "\(String(describing: sut?.invoiceViewModel.getDiscuntValue() ?? 0.0))")
        } else {
            sut?.view?.configureDiscount(discountType: .fixed, discountValue: "\(sut?.invoiceViewModel.invoiceDetails.discountValue ?? 0.0)", value: "\(String(describing: sut?.invoiceViewModel.getDiscuntValue() ?? 0.0))")
        }
        
        wait(interval: 0.0001) {
            XCTAssertEqual(self.mockView?.containerView.discuntView.keyLabel.text , "Discount (2.0)%")
            XCTAssertEqual(self.mockView?.containerView.discuntView.valueLabel.text , "10.0 EGP")
        }

    }
    
    func test_invoiceDate() {
        sut?.setupInvoiceDate()
        wait(interval: 0.0001) {
            XCTAssertEqual(self.mockView?.containerView.invoiceDetails.productQuantityLabel.text , "Valid till " + "20-06-2022")
        }
    }
    
    func test_subTotal() {
        sut?.view?.configureSubTotal(subTotal: "\(sut?.subTotal ?? 0.0)")
        wait(interval: 0.0001) {
            XCTAssertEqual(self.mockView?.containerView.subTotalView.valueLabel.text, "500.0 EGP")
        }
    }
    
    func test_total() {
        sut?.view?.configureTotal(total:"\( sut?.invoiceViewModel.getTotal() ?? 0.0)")
        
        wait(interval: 0.0001) {
            XCTAssertEqual(self.mockView?.containerView.totalAmountView.keyValueViewContainer.valueLabel.text, "500.0 EGP")
        }
    }
    
    func test_logo_configuration() {
        sut?.view?.setupLogoConfigurations(isLogoEnabled: false, logoUrl: "")
        wait(interval: 0.0001) {
            XCTAssertTrue(((self.mockView?.containerView.logoView.isHidden) != nil))
            XCTAssert(self.mockView?.containerView.logoView.isHidden == true)
        }
    }
    
    func test_billedFrom_configuration() {
        sut?.view?.setupBilledFromConfiguration(isEnabled: false)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.billedFromView.isHidden == true)
        }
        sut?.view?.setupBilledFromConfiguration(isEnabled: true)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.billedFromView.isHidden == false)
        }
    }
    
    func test_billedTo_configuration() {
        sut?.view?.setupBilledToConfiguration(isEnabled: false)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.billedToView.isHidden == true)
        }
        sut?.view?.setupBilledToConfiguration(isEnabled: true)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.billedToView.isHidden == false)
        }
    }
    
    func test_totalAmount_configuration() {
        sut?.view?.setupTotalAmountConfiguration(isEnabled: false)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.totalAmountView.isHidden == true)
        }
        
        sut?.view?.setupTotalAmountConfiguration(isEnabled: true)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.totalAmountView.isHidden == false)
        }
    }
    
    func test_accounting_configuration() {
        sut?.view?.setupAccountingConfiguration(isEnabled: false)
        
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.subTotalView.isHidden == true)
            XCTAssert(self.mockView?.containerView.taxView.isHidden == true)

            XCTAssert(self.mockView?.containerView.shippingView.isHidden == true)
            XCTAssert(self.mockView?.containerView.discuntView.isHidden == true)
        }
        
        sut?.view?.setupAccountingConfiguration(isEnabled: true)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.subTotalView.isHidden == false)
            XCTAssert(self.mockView?.containerView.taxView.isHidden == false)

            XCTAssert(self.mockView?.containerView.shippingView.isHidden == false)
            XCTAssert(self.mockView?.containerView.discuntView.isHidden == false)
        }
    }
    
    func test_shippingPolicy_configuration() {
        sut?.view?.setupShippingPolicyConfiguration(isEnabled: false)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.shippingRefundButtonContainer.shippingPolicyButton.isHidden == true)
        }
        
        sut?.view?.setupShippingPolicyConfiguration(isEnabled: true)
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.shippingRefundButtonContainer.shippingPolicyButton.isHidden == false)
        }
    }
    
    func test_refundPolicy_configuration() {
        sut?.view?.setupRefundPolicyConfiguration(isEnabled: false)
        
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.shippingRefundButtonContainer.refundPolicyButton.isHidden == true)
        }
        
        sut?.view?.setupRefundPolicyConfiguration(isEnabled: true)
        
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.shippingRefundButtonContainer.refundPolicyButton.isHidden == false)
        }
    }
    
}


class InvoiceFirstScreenViewModelMock{
    func getMockVm() -> InvoiceFirstScreenViewModel {
        let item1 = InvoiceItemsCodable(name: "Testing Expired", description: "Testing Expired Desc", quantity: 5, price: 100)
        
        
        let invDetailsMock = InvoiceCodable(invoiceNumber: "CIR_INV_1655838181938",
                                            items: [item1],
                                            customerMobile: "+201061140960",
                                            status: 0,
                                            createDate: "2022-06-21T19:03:01.000Z",
                                            dueDate: "2022-06-20T22:00:00.000Z",
                                            prefPaymenMethod: "",
                                            shippingFees: 10,
                                            discountValue: 2,
                                            discountType: "percentage",
                                            discountValueCalculated: 10,
                                            tax: 0,
                                            taxValue: 0,
                                            shippingPolicy:"",
                                            returnPolicy: "",
                                            extraNotes: "",
                                            totalValue: 500,
                                            subTotalValue: 500)
        
        
        let merchantDetailsMock = MerchantCodable(firstName: "Mahmoud",
                                                  lastName: "Allam",
                                                  email: "allam40960@gmail.com",
                                                  mobileNumber: "+201157818027",
                                                  businessName: "EGiant",
                                                  businessAddress: "",
                                                  refundPolicy: "Refund",
                                                  shippingPolicy: "Shipping",
                                                  status: "",
                                                  merchantToken: "")
        
        return InvoiceFirstScreenViewModel(invoiceDetails: invDetailsMock, merchantDetails: merchantDetailsMock)
    }
    
    func getInvoiceCustomer() -> CustomerCodable {
        return CustomerCodable(firstName: "Allam",
                               lastName: "Allam",
                               email: "mahmoudallam@circlepay.ai",
                               mobileNumber: "+201061140960",
                               country: "Egypt",
                               governorate: "A",
                               city: "Cairo",
                               address: "_",
                               aptNumber: "123")
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
