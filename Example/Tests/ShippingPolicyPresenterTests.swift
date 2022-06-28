//
//  ShippingPolicyPresenterTests.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by Alchemist on 28/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
@testable import CirclePay_Pod_iOS
import XCTest

class ShippingPolicyPresenterTests: XCTestCase {

    var sut : ShippingPolicyPresenter?
    var mockView: ShippingPolicyViewController?
    var mockInteractor: ShippingPolicyInteractor?
    var mockRouter: ShippingPolicyRouter?
    /* We need to do a lot of setup here to make sure all
     out dependcies are loaded before the tests are run.*/
    override func setUp() {
        
        mockView = ShippingPolicyViewController()
        mockInteractor = ShippingPolicyInteractor()
        mockRouter = ShippingPolicyRouter()
        
        sut = ShippingPolicyPresenter(view: mockView!, interactor: mockInteractor!, router: mockRouter!, shippingPolicy: "Shipping Policy Text")
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
    
    func test_shipping_policy_text() {
        sut?.view?.setupShippingPolicy(shippingPolicy: sut?.shippingPolicy ?? "")
        wait(interval: 0.0001) {
            XCTAssert(self.mockView?.containerView.textView.text == "Shipping Policy Text")
        }
    }
}
