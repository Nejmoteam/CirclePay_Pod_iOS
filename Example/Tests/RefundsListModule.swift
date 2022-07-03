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

class RefundsListModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Refunds_List() {
        //GIVEN
        stub(condition: listRefundsStubCondition() ) { urlRequest in
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
                    ],
                    [
                        "refund_id": 1655635103054,
                        "external_ref_id": "52484137",
                        "init_date": "2022-06-19T10:38:25.000Z",
                        "update_date": "2022-06-19T10:38:26.000Z",
                        "status": "INITIALIZED",
                        "value": 180.0,
                        "transaction_id": "610b2c496df621209c852175",
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: [RefundCodable]? = nil
        let expectation =  self.expectation(description: "Failed To list refunds")
        //WHEN
        CirclePay.refunds.getAllRefunds { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.refundId == 1655635173883)
        XCTAssert(expectedResponse?.first?.externalRefId == "43334935")
        XCTAssert(expectedResponse?.first?.initDate == "2022-06-19T10:39:37.000Z")
        XCTAssert(expectedResponse?.first?.updateDate == "2022-06-19T10:40:50.000Z")
        XCTAssert(expectedResponse?.first?.status == "FAILED")
        XCTAssert(expectedResponse?.first?.value == 180.0)
        XCTAssert(expectedResponse?.first?.transactionId == "610b2c496df621209c852166")
        
        XCTAssert(expectedResponse?.last?.refundId == 1655635103054)
        XCTAssert(expectedResponse?.last?.externalRefId == "52484137")
        XCTAssert(expectedResponse?.last?.initDate == "2022-06-19T10:38:25.000Z")
        XCTAssert(expectedResponse?.last?.updateDate == "2022-06-19T10:38:26.000Z")
        XCTAssert(expectedResponse?.last?.status == "INITIALIZED")
        XCTAssert(expectedResponse?.last?.value == 180.0)
        XCTAssert(expectedResponse?.last?.transactionId == "610b2c496df621209c852175")
    }
    
    func listRefundsStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("refund/list") ?? false
            let methodCondition = req.method == HTTPMethod.post
            return urlCondition && methodCondition
        }
    }
    
}
