//
//  RefundsListModule.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 29/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class RefundGetModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Refund_Get() {
        //GIVEN
        stub(condition: getRefundStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "refund_id": 1655635173883,
                        "external_ref_id": "43334935",
                        "init_date": "2022-06-19T10:39:37.000Z",
                        "update_date": "2022-06-19T10:40:50.000Z",
                        "status": "FAILED",
                        "value": 180.0,
                        "transaction_id": "610b2c496df621209c852166"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: RefundCodable? = nil
        let expectation =  self.expectation(description: "Failed To get refund")
        let refundID = 1655635173883
        //WHEN
        CirclePay.refunds.getRefuntStatus(refundId: refundID) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.refundId == 1655635173883)
        XCTAssert(expectedResponse?.externalRefId == "43334935")
        XCTAssert(expectedResponse?.initDate == "2022-06-19T10:39:37.000Z")
        XCTAssert(expectedResponse?.updateDate == "2022-06-19T10:40:50.000Z")
        XCTAssert(expectedResponse?.status == "FAILED")
        XCTAssert(expectedResponse?.value == 180.0)
        XCTAssert(expectedResponse?.transactionId == "610b2c496df621209c852166")
    }
    
    func getRefundStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("refund/get") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let refundId = req.url?.absoluteString.contains("1655635173883") ?? false
            return urlCondition && methodCondition && refundId
        }
    }
    
}
