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

class PaymentsGetModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_payments_Get() {
        //GIVEN
        stub(condition: getPaymentsStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "id": 3919,
                        "transaction_id": 1655635173883,
                        "external_ref_id": "43334935",
                        "init_date": "2022-06-19T10:39:37.000Z",
                        "update_date": "2022-06-19T10:40:50.000Z",
                        "customer_mobile": "+201111947539",
                        "status": "FAILED",
                        "payment_link_url": nil,
                        "invoice_num": "CIR_INV_1655635148868",
                        "value": 180.0,
                        "net_fees": 3.8,
                        "currency": "EGP",
                        "payment_method_id": "610b2c496df621209c852166",
                        "payment_method_name": "CARD",
                        "payment_gateway_name": "PayMob"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: PaymentCodable? = nil
        let expectation =  self.expectation(description: "Failed To list payments")
        let transactionId = 1655635173883
        CirclePay.payments.getPayment(transactionId: transactionId) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.id == 3919)
        XCTAssert(expectedResponse?.transactionId == 1655635173883)
        XCTAssert(expectedResponse?.externalRefId == "43334935")
        XCTAssert(expectedResponse?.initDate == "2022-06-19T10:39:37.000Z")
        XCTAssert(expectedResponse?.updateDate == "2022-06-19T10:40:50.000Z")
        XCTAssert(expectedResponse?.customerMobile == "+201111947539")
        XCTAssert(expectedResponse?.status == "FAILED")
        XCTAssert(expectedResponse?.paymentLinkUrl == nil)
        XCTAssert(expectedResponse?.invoiceNum == "CIR_INV_1655635148868")
        XCTAssert(expectedResponse?.value == 180.0)
        XCTAssert(expectedResponse?.netFees == 3.8)
        XCTAssert(expectedResponse?.currency == "EGP")
        XCTAssert(expectedResponse?.paymentMethodId == "610b2c496df621209c852166")
        XCTAssert(expectedResponse?.paymentMethodName == "CARD")
        XCTAssert(expectedResponse?.paymentGatewayName == "PayMob")
    }
    
    func getPaymentsStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("payment/get") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let transactionId = req.url?.absoluteString.contains("1655635173883") ?? false
            return urlCondition && methodCondition && transactionId
        }
    }
    
}
