//
//  InvoiceDeleteModule.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 19/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class InvoiceDeleteModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Invoice_Delete() {
        //GIVEN
        stub(condition: deleteInvoiceStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [[
                    "invoice_number":"CIR_INV_1655386160987"
                ]]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: InvoiceDeleteCodable? = nil
        let invoiceNumber = "CIR_INV_1655386160987"
        let expectation =  self.expectation(description: "Failed To Delete Invoice")
        //WHEN
        CirclePay.invoices.deleteInvoice(invoiceNumber: invoiceNumber) { module, error in
            expectedResponse = module
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.invoiceNumber == "CIR_INV_1655386160987")
    }
    
    func deleteInvoiceStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("invoice/delete") ?? false
            let methodCondition = req.method == HTTPMethod.delete
            let invoiceNumberCondition = req.url?.absoluteString.contains( "CIR_INV_1655386160987") ?? false
            return urlCondition && methodCondition && invoiceNumberCondition
        }
    }
    
}
