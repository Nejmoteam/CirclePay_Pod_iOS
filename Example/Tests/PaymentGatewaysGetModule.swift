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

class PaymentGatewaysGetModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_payment_gateways_Get() {
        //GIVEN
        stub(condition: getPaymentGatewaysStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "id": "610b2c486df621209c85215b",
                        "name": "PayMob"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: PaymentGatewayCodable? = nil
        let expectation =  self.expectation(description: "Failed To get payment gateway")
        //WHEN
        CirclePay.paymentGateways.getPaymentGetway(paymentGatewayId: "610b2c486df621209c85215b") { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.id == "610b2c486df621209c85215b")
        XCTAssert(expectedResponse?.name == "PayMob")
    }
    
    func getPaymentGatewaysStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("payment/gateway/get") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let paymentGatewayId = req.url?.absoluteString.contains("610b2c486df621209c85215b") ?? false
            return urlCondition && methodCondition && paymentGatewayId
        }
    }
    
}
