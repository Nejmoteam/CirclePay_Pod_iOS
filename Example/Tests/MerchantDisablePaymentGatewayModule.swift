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

class MerchantDisablePaymentGatewayModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_disable_payment_gateway() {
        //GIVEN
        stub(condition: disableMerchantPaymentGatewayStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "payment_gateway_id": "610b2c486df621209c85215a"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: MerchantPaymentGatewayEnabledCodable? = nil
        let expectation =  self.expectation(description: "Failed To Disable Merchant payment gateway")
        let paymentGatewayId = "610b2c486df621209c85215a"
        //WHEN
        CirclePay.merchants.disablePaymentGateway(paymentGatewayId: paymentGatewayId) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.paymentGatewayId == "610b2c486df621209c85215a")
        
    }
    
    func disableMerchantPaymentGatewayStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/payment/gateway/disable") ?? false
            let methodCondition = req.method == HTTPMethod.delete
            let gatewayIdCondition = req.url?.absoluteString.contains("610b2c486df621209c85215a") ?? false
            return urlCondition && methodCondition && gatewayIdCondition
        }
    }
    
}
