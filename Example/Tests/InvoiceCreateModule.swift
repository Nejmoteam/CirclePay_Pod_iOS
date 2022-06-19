//
//  InvoiceCreateTest.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 16/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class InvoiceCreateModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Invoice_Create() {
        //GIVEN
        stub(condition: createInvoiceStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [[
                    "invoice_number":"CIR_INV_1655386160987",
                    "invoice_url":"https://staging.circlepay.ai/payment/make-payment/37a16654f92abc07d3811655386160980/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxdWVyeVBhcmFtcyI6Ij9zdGVwPTAmT1BFeHRlcm5hbD0xNjU1Mzg2MTYxMDEwJnNvdXJjZT1leHRlcm5hbCIsImlhdCI6MTY1NTM4NjE2MX0.8EZhT2oIMmz77c4rzXNQNgPcqy9bWc2bxlXEONbm-eY"
                ]]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: CreateInvoiceCodable? = nil
        let items = [Items(itemDescription: "item1", itemnName: "invoice", itemPrice: 50.0, itemQuantity: 1)]
        let customerMobile = "+201157818027"
        let dueDate = "2022-10-2"
        let expectation =  self.expectation(description: "Failed To Create Invoice")
        //WHEN
        CirclePay.invoices.createInvoice(items: items, customerMobile: customerMobile, dueDate: dueDate) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.invoiceNumber == "CIR_INV_1655386160987")
        XCTAssert(expectedResponse?.invoiceUrl == "https://staging.circlepay.ai/payment/make-payment/37a16654f92abc07d3811655386160980/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxdWVyeVBhcmFtcyI6Ij9zdGVwPTAmT1BFeHRlcm5hbD0xNjU1Mzg2MTYxMDEwJnNvdXJjZT1leHRlcm5hbCIsImlhdCI6MTY1NTM4NjE2MX0.8EZhT2oIMmz77c4rzXNQNgPcqy9bWc2bxlXEONbm-eY")
        
    }
    
    func createInvoiceStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("invoice/create") ?? false
            let methodCondition = req.method == HTTPMethod.post
            if let httpBody = req.ohhttpStubs_httpBody {
                let bodyString = String.init(data: httpBody, encoding: String.Encoding.utf8)
                
                let filteredStringBody = bodyString?.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
                let bodyCondition = (filteredStringBody?.contains("due_date:2022-10-2"))! &&
                (filteredStringBody?.contains("customer_mobile:+201157818027"))! &&
                (filteredStringBody?.contains("description:item1"))! && (filteredStringBody?.contains("price:50"))! && (filteredStringBody?.contains("name:invoice"))! &&
                (filteredStringBody?.contains("quantity:1"))!
                return urlCondition && bodyCondition && methodCondition
            } else {
                return urlCondition && methodCondition
            }
        }
    }
    
}
