//
//  InvoiceGetModule.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 19/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class InvoiceGetModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Invoice_Get() {
        //GIVEN
        stub(condition: getInvoiceStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [[
                    "invoice_number":"CIR_INV_1655386160987",
                    "customer_mobile":"+201157818027",
                    "status":0,
                    "create_date":"2022-06-16T13:29:20.000Z",
                    "due_date":"2022-10-02T00:00:00.000Z",
                    "shipping_fees":0.0,
                    "discount_value":0.0,
                    "discount_type":"Percentage",
                    "discount_value_calculated":0.0,
                    "tax":0.0,
                    "tax_value":0.0,
                    "total_value":50.0,
                    "sub_total_value":50.0,
                    "items":[
                        [
                            "name":"invoice",
                            "description":"",
                            "quantity":1,
                            "price":50.0
                        ]
                    ]
                ]]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: InvoiceCodable? = nil
        let invoiceNumber = "CIR_INV_1655386160987"
        let expectation =  self.expectation(description: "Failed To Get Invoice")
        //WHEN
        CirclePay.invoices.getInvoice(invoiceNumber: invoiceNumber) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.invoiceNumber == "CIR_INV_1655386160987")
        XCTAssert(expectedResponse?.customerMobile == "+201157818027")
        XCTAssert(expectedResponse?.status == 0)
        XCTAssert(expectedResponse?.createDate == "2022-06-16T13:29:20.000Z")
        XCTAssert(expectedResponse?.dueDate == "2022-10-02T00:00:00.000Z")
        XCTAssert(expectedResponse?.shippingFees == 0)
        XCTAssert(expectedResponse?.discountValue == 0)
        XCTAssert(expectedResponse?.discountType == "Percentage")
        XCTAssert(expectedResponse?.discountValueCalculated == 0)
        XCTAssert(expectedResponse?.tax == 0)
        XCTAssert(expectedResponse?.taxValue == 0)
        XCTAssert(expectedResponse?.totalValue == 50.0)
        XCTAssert(expectedResponse?.subTotalValue == 50.0)
        XCTAssert(expectedResponse?.items?.first?.name == "invoice")
        XCTAssert(expectedResponse?.items?.first?.description == "")
        XCTAssert(expectedResponse?.items?.first?.quantity == 1)
        XCTAssert(expectedResponse?.items?.first?.price == 50.0)
    }
    
    func getInvoiceStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("invoice/get") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let invoiceNumberCondition = req.url?.absoluteString.contains( "CIR_INV_1655386160987") ?? false
            return urlCondition && methodCondition && invoiceNumberCondition
        }
    }
    
}
