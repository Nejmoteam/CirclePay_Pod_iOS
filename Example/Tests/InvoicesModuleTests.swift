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
import Alamofire
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
                let methodCondtion = req.method == HTTPMethod.post
                var httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
                httpHeader["merchant-token"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIwNiwiaXNWZXJpZmllZCI6ZmFsc2UsInRva2VuIjoiIiwiZm9yZ2V0UGFzc3dvcmR0b2tlbiI6IiIsImdvb2dsZU9hdXRoSUQiOiIiLCJmYWNlYm9va09hdGhJZCI6IiIsImF1dGh5X2lkIjoiIiwic3RhdHVzIjoiMCIsImFkZHJlc3MiOiIiLCJidXNpbmVzc05hbWUiOiIiLCJmaXJzdE5hbWUiOiJNYWhtb3VkIiwibGFzdE5hbWUiOiJBbGxhbSIsImVtYWlsIjoiYWxsYW00MDk2MEBnbWFpbC5jb20iLCJtb2JpbGUiOiIrMjAxMTU3ODE4MDI3IiwiYnVzaW5lc3NBZGRyZXNzIjoiTWVub2ZpYSIsInVzZXJuYW1lIjpudWxsLCJ1cGRhdGVkQXQiOiIyMDIyLTA2LTE0VDEyOjE3OjI0Ljc2MVoiLCJjcmVhdGVkQXQiOiIyMDIyLTA2LTE0VDEyOjE3OjI0Ljc2MVoiLCJhcHBfbmFtZSI6Ik5vaGEgUmFkaSIsImlhdCI6MTY1NTIwOTA0NH0.93WGfv9FIQngCb9ICcIsgaUtNN5VZHz-XdTA7a1cQXk"
                httpHeader["account-token"] = "Bearer eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2Iiwia2lkIjpudWxsLCJjdHkiOiJKV1QifQ..dwuPPjmNsyXv4ZuPsuWzQA.3pAMatxtxLHVsakkBnxHz0J57F-qrmpO-TikuVFHQqsVQxnm0bAWiOiC0ZUvL5EjK51ZBILQ483l0164RYqtqEsZkGw4bqyC5tY0v2oQvZrKpk_lUI92njCyKrsaS4BiCN4EOLIa3fOK3Nx5O0ITz1ohYEwbaXhgVm85_VzOhxzrlVf0IVBV3qjYpHAy5gaA8FYu0tQQGlLP3jK10oeVvSScwokk48gujXIRVnDwAuMtYCoWaWxtYxm1ZXQpfZekTV9EgEGAYvSiuC5FAF3a-yh3c7gwzYK5ips3EXhJVbzSaZcZnesCNV4h6EEoKzsb-f_BRiY9sw-SQXX71dzjOYYVS7mH4OrZvPIVw1H8tIJ1nVd3j2QlYsYfh4mfKVoS.5A12HGs6ExJiddpAF1B0oQ"
                httpHeader["account-key"] = "e1a69fb4-193e-3756-b600-5fade92c5eb4"
                httpHeader["Content-Type"] = "application/json"
                httpHeader["Content-Length"] = "112"
                httpHeader["Accept-Language"] = "en;q=1.0, ar-US;q=0.9"
                let headersDic = req.headers.dictionary
                let headerCondition = headersDic == httpHeader
                return urlCondition && bodyCondition && headerCondition && methodCondtion
            } else {
                return urlCondition
            }
        }
    }

}
