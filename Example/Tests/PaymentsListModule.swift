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

class PaymentsListModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_payments_List() {
        //GIVEN
        stub(condition: listPaymentsStubCondition() ) { urlRequest in
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
                    ],
                    [
                        "id": 3918,
                        "transaction_id": 1655635103054,
                        "external_ref_id": "52484137",
                        "init_date": "2022-06-19T10:38:25.000Z",
                        "update_date": "2022-06-19T10:38:26.000Z",
                        "customer_mobile": "+201111947539",
                        "status": "INITIALIZED",
                        "payment_link_url": nil,
                        "invoice_num": "CIR_INV_1655634930352",
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
        var expectedResponse: [PaymentCodable]? = nil
        let expectation =  self.expectation(description: "Failed To list payments")
        let couponCode:String? = nil
        let customerMobile:String? = nil
        let invoiceNum:String? = nil
        let paymentLink:String? = nil
        //WHEN
        CirclePay.payments.getAllPayments(couponCode: couponCode, customerMobile: customerMobile, invoiceNum: invoiceNum, paymentLinkUrl: paymentLink) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.id == 3919)
        XCTAssert(expectedResponse?.first?.transactionId == 1655635173883)
        XCTAssert(expectedResponse?.first?.externalRefId == "43334935")
        XCTAssert(expectedResponse?.first?.initDate == "2022-06-19T10:39:37.000Z")
        XCTAssert(expectedResponse?.first?.updateDate == "2022-06-19T10:40:50.000Z")
        XCTAssert(expectedResponse?.first?.customerMobile == "+201111947539")
        XCTAssert(expectedResponse?.first?.status == "FAILED")
        XCTAssert(expectedResponse?.first?.paymentLinkUrl == nil)
        XCTAssert(expectedResponse?.first?.invoiceNum == "CIR_INV_1655635148868")
        XCTAssert(expectedResponse?.first?.value == 180.0)
        XCTAssert(expectedResponse?.first?.netFees == 3.8)
        XCTAssert(expectedResponse?.first?.currency == "EGP")
        XCTAssert(expectedResponse?.first?.paymentMethodId == "610b2c496df621209c852166")
        XCTAssert(expectedResponse?.first?.paymentMethodName == "CARD")
        XCTAssert(expectedResponse?.first?.paymentGatewayName == "PayMob")
        
        XCTAssert(expectedResponse?.last?.id == 3918)
        XCTAssert(expectedResponse?.last?.transactionId == 1655635103054)
        XCTAssert(expectedResponse?.last?.externalRefId == "52484137")
        XCTAssert(expectedResponse?.last?.initDate == "2022-06-19T10:38:25.000Z")
        XCTAssert(expectedResponse?.last?.updateDate == "2022-06-19T10:38:26.000Z")
        XCTAssert(expectedResponse?.last?.customerMobile == "+201111947539")
        XCTAssert(expectedResponse?.last?.status == "INITIALIZED")
        XCTAssert(expectedResponse?.last?.paymentLinkUrl == nil)
        XCTAssert(expectedResponse?.last?.invoiceNum == "CIR_INV_1655634930352")
        XCTAssert(expectedResponse?.last?.value == 180.0)
        XCTAssert(expectedResponse?.last?.netFees == 3.8)
        XCTAssert(expectedResponse?.last?.currency == "EGP")
        XCTAssert(expectedResponse?.last?.paymentMethodId == "610b2c496df621209c852166")
        XCTAssert(expectedResponse?.last?.paymentMethodName == "CARD")
        XCTAssert(expectedResponse?.last?.paymentGatewayName == "PayMob")
    }
    
    func listPaymentsStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("payment/list") ?? false
            let methodCondition = req.method == HTTPMethod.post
            return urlCondition && methodCondition
        }
    }
    
}
