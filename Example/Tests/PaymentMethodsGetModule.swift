//
//  PaymentListModule.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 27/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class PaymentMethodsGetModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_payment_methods_Get() {
        //GIVEN
        stub(condition: getPaymentMethodStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "id": "610b2c486df621209c85215b",
                        "name": "CARD",
                        "gateway_id": "610b2c486df621209c85215b"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: PaymentMethodCodable? = nil
        let expectation =  self.expectation(description: "Failed To get payment methods")
        let paymentMethodId = "610b2c486df621209c85215b"
        //WHEN
        CirclePay.paymentMethods.getPaymentMethod(paymentMethodId: paymentMethodId) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.id == "610b2c486df621209c85215b")
        XCTAssert(expectedResponse?.name == "CARD")
        XCTAssert(expectedResponse?.gatewayId == "610b2c486df621209c85215b")
    }
    
    func getPaymentMethodStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("payment/methods/get") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let paymentMethodId = req.url?.absoluteString.contains("610b2c486df621209c85215b") ?? false
            return urlCondition && methodCondition && paymentMethodId
        }
    }
}
