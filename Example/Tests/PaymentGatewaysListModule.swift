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

class PaymentGatewaysListModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_payment_gateways_List() {
        //GIVEN
        stub(condition: listPaymentGatewaysStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "id": "610b2c486df621209c85215b",
                        "name": "PayMob"
                    ],
                    [
                        "id": "610b2c486df621209c85215a",
                        "name": "MyFatoorah"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: [PaymentGatewayCodable]? = nil
        let expectation =  self.expectation(description: "Failed To list payment gateways")
        //WHEN
        CirclePay.paymentGateways.getAllPaymentGetways { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.id == "610b2c486df621209c85215b")
        XCTAssert(expectedResponse?.first?.name == "PayMob")
       
        
        XCTAssert(expectedResponse?.last?.id == "610b2c486df621209c85215a")
        XCTAssert(expectedResponse?.last?.name == "MyFatoorah")
       
        
    }
    
    func listPaymentGatewaysStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("payment/gateway/list") ?? false
            let methodCondition = req.method == HTTPMethod.get
            return urlCondition && methodCondition
        }
    }
    
}
