//
//  RefundPolicyPresenterTests.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by Alchemist on 28/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
@testable import CirclePay_Pod_iOS
import XCTest

class RefundPolicyPresenterTests: XCTestCase {

    var sut : RefundPolicyPresenter?
    var mockView: RefundPolicyViewController?
    var mockInteractor: RefundPolicyInteractor?
    var mockRouter: RefundPolicyRouter?
    /* We need to do a lot of setup here to make sure all
     out dependcies are loaded before the tests are run.*/
    override func setUp() {
        
        mockView = RefundPolicyViewController()
        mockInteractor = RefundPolicyInteractor()
        mockRouter = RefundPolicyRouter()
        
        sut = RefundPolicyPresenter(view: mockView!, interactor: mockInteractor!, router: mockRouter!, refundPolicy: "Refund Policy Text")
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
        super.tearDown()
    }
    
    func test_refund_policy_text() {
        sut?.view?.setupRefundPolicy(refundPolicy: sut?.refundPolicy ?? "")
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.textView.text == "Refund Policy Text")
        }
    }
    

}
