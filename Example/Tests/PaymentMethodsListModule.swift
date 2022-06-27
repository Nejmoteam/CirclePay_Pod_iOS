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

class PaymentMethodsListModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_payment_methods_List() {
        //GIVEN
        stub(condition: listPaymentMethodsStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "id": "610b2c486df621209c85215b",
                        "name": "CARD",
                        "gateway_id": "610b2c486df621209c85215b"
                    ],
                    [
                        "id": "610b2c486df621209c85215a",
                        "name": "CASH",
                        "gateway_id": "610b2c486df621209c85215b"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: [PaymentMethodCodable]? = nil
        let expectation =  self.expectation(description: "Failed To list payment methods")
        let paymentGatewayId = "610b2c486df621209c85215b"
        //WHEN
        CirclePay.paymentMethods.getAllPaymentMethods(paymentGatewayId: paymentGatewayId) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.id == "610b2c486df621209c85215b")
        XCTAssert(expectedResponse?.first?.name == "CARD")
        XCTAssert(expectedResponse?.first?.gatewayId == "610b2c486df621209c85215b")
        
        
        XCTAssert(expectedResponse?.last?.id == "610b2c486df621209c85215a")
        XCTAssert(expectedResponse?.last?.name == "CASH")
        XCTAssert(expectedResponse?.last?.gatewayId == "610b2c486df621209c85215b")
    }
    
    func listPaymentMethodsStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("payment/methods/list") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let paymentGatewayId = req.url?.absoluteString.contains("610b2c486df621209c85215b") ?? false
            return urlCondition && methodCondition && paymentGatewayId
        }
    }
}
