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

class MerchantListPaymentMethodsModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_List_payment_methods() {
        //GIVEN
        stub(condition: ListMerchantPaymentMethodsStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "id": "610b2c486df621209c85215c",
                        "name": "AMEX",
                        "gateway_id": "610b2c486df621209c85215a",
                        "status": true,
                        "rate_Object": [
                            "payment_fee_percentage": 3,
                            "payment_fee_amount": 3.0,
                            "refund_fee_percentage": 0,
                            "refund_fee_amount": 0.0
                        ]
                    ],
                    [
                        "id": "610b2c486df621209c85215d",
                        "name": "Sadad",
                        "gateway_id": "610b2c486df621209c85215a",
                        "status": true,
                        "rate_Object": [
                            "payment_fee_percentage": 3,
                            "payment_fee_amount": 3.0,
                            "refund_fee_percentage": 0,
                            "refund_fee_amount": 0.0
                        ]
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: [MerchantPaymentMethodCodable]? = nil
        let expectation =  self.expectation(description: "Failed To list Merchant payment methods")
        //WHEN
        CirclePay.merchants.listPaymentMethods { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.id == "610b2c486df621209c85215c")
        XCTAssert(expectedResponse?.first?.name == "AMEX")
        XCTAssert(expectedResponse?.first?.gateWayId == "610b2c486df621209c85215a")
        XCTAssert(expectedResponse?.first?.status == true)
        XCTAssert(expectedResponse?.first?.rateObject?.paymentFeePercentage == 3.0)
        XCTAssert(expectedResponse?.first?.rateObject?.paymentFeeAmount == 3.0)
        XCTAssert(expectedResponse?.first?.rateObject?.refundFeePercentage == 0)
        XCTAssert(expectedResponse?.first?.rateObject?.refundFeeAmount == 0)
        
        
        XCTAssert(expectedResponse?.last?.id == "610b2c486df621209c85215d")
        XCTAssert(expectedResponse?.last?.name == "Sadad")
        XCTAssert(expectedResponse?.first?.gateWayId == "610b2c486df621209c85215a")
        XCTAssert(expectedResponse?.last?.status == true)
        XCTAssert(expectedResponse?.first?.rateObject?.paymentFeePercentage == 3.0)
        XCTAssert(expectedResponse?.first?.rateObject?.paymentFeeAmount == 3.0)
        XCTAssert(expectedResponse?.first?.rateObject?.refundFeePercentage == 0)
        XCTAssert(expectedResponse?.first?.rateObject?.refundFeeAmount == 0)
    }
    
    func ListMerchantPaymentMethodsStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/payment/method/list") ?? false
            let methodCondition = req.method == HTTPMethod.get
            return urlCondition && methodCondition
        }
    }
    
}
