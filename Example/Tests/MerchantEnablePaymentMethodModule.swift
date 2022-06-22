//
//  MerchantCreateModule.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 22/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class MerchantEnablePaymentMethodModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_enable_payment_method() {
        //GIVEN
        stub(condition: enableMerchantPaymentMethodStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "payment_method_id": "610b2c486df621209c85215d"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: MerchantPaymentMethodEnabledCodable? = nil
        let expectation =  self.expectation(description: "Failed To Enable Merchant payment method")
        let paymentMethodId = "610b2c486df621209c85215d"
        //WHEN
        CirclePay.merchants.enablePaymentMethod(paymentMethodId: paymentMethodId) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.paymentMethodId == "610b2c486df621209c85215d")
        
    }
    
    func enableMerchantPaymentMethodStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/payment/method/enable") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let gatewayIdCondition = req.url?.absoluteString.contains("610b2c486df621209c85215d") ?? false
            return urlCondition && methodCondition && gatewayIdCondition
        }
    }
    
}
