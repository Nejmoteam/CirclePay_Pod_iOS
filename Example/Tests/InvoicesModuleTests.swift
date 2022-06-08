//
//  InvoicesModuleTests.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by Alchemist on 08/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs

class InvoicesModuleTests: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Invoice_Pay() {
        //GIVEN
        stub(condition: payInvoiceStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [[
                    "transaction_id":"123456666",
                    "invoice_url":"https://staging-openapi.circlepay.ai/"
                ]]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: InvoicePayCodable? = nil
        let invNumber = "CIR_INV_1653564987377"
        let customerMobile = "+201157818027"
        let paymentMethodId = "1653564987377"
        let expectation =  self.expectation(description: "Failed To Pay Invoice")
        //WHEN
        CirclePay.invoices.payInvoice(invoiceNumber: invNumber, customerMobile: customerMobile, paymentMethodId: paymentMethodId) { model, err in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.transactionId == "123456666")
        XCTAssert(expectedResponse?.invoiceUrl == "https://staging-openapi.circlepay.ai/")

    }

    func payInvoiceStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("invoice/pay") ?? false
            if let httpBody = req.ohhttpStubs_httpBody {
                let bodyString = String.init(data: httpBody, encoding: String.Encoding.utf8)
                
                let filteredStringBody = bodyString?.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
                let bodyCondition = (filteredStringBody?.contains("payment_method_id:1653564987377"))! &&
                    (filteredStringBody?.contains("customer_mobile:+201157818027"))! &&
                    (filteredStringBody?.contains("invoice_number:CIR_INV_1653564987377"))!
                return urlCondition && bodyCondition
            } else {
                return urlCondition
            }
        }
    }

}
