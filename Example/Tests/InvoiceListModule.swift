//
//  InvoiceListModule.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 19/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class InvoiceListModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Invoice_List() {
        //GIVEN
        stub(condition: listInvoiceStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [[
                    "invoice_number":"CIR_INV_1655045054525",
                    "customer_mobile":"+201148379445",
                    "status":0,
                    "create_date":"2022-06-12T14:44:14.000Z",
                    "due_date":"2022-07-20T00:00:00.000Z",
                    "shipping_fees":0.0,
                    "discount_value":0.0,
                    "discount_type":"Percentage",
                    "discount_value_calculated":0.0,
                    "tax":0.0,
                    "tax_value":0.0,
                    "total_value":0.0,
                    "sub_total_value":0.0,
                    "items":[
                        [
                            "name":"t-shirt1",
                            "description":"",
                            "quantity":1,
                            "price":1.0
                        ]
                    ]
                ],
                [
                    "invoice_number":"CIR_INV_1653569048600",
                    "customer_mobile":"+201148379445",
                    "status":0,
                    "create_date":"2022-05-26T12:44:08.000Z",
                    "due_date":"2022-07-20T00:00:00.000Z",
                    "shipping_fees":5.0,
                    "discount_value":10.0,
                    "discount_type":"Percentage",
                    "discount_value_calculated":10.0,
                    "tax":20.0,
                    "tax_value":20.0,
                    "total_value":0.0,
                    "sub_total_value":0.0,
                    "items": [
                        [
                            "name":"t-shirt1",
                            "description": "",
                            "quantity": 1,
                            "price": 200.0
                        ]
                    ]
                ]]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: [InvoiceCodable]? = nil
        let customerMobile = "+201148379445"
        let expectation =  self.expectation(description: "Failed To List Invoice")
        //WHEN
        CirclePay.invoices.listInvoices(customerMobile: customerMobile) { module, error in
            expectedResponse = module
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.invoiceNumber == "CIR_INV_1655045054525")
        XCTAssert(expectedResponse?.first?.customerMobile == "+201148379445")
        XCTAssert(expectedResponse?.first?.status == 0)
        XCTAssert(expectedResponse?.first?.createDate == "2022-06-12T14:44:14.000Z")
        XCTAssert(expectedResponse?.first?.dueDate == "2022-07-20T00:00:00.000Z")
        XCTAssert(expectedResponse?.first?.shippingFees == 0)
        XCTAssert(expectedResponse?.first?.discountValue == 0)
        XCTAssert(expectedResponse?.first?.discountType == "Percentage")
        XCTAssert(expectedResponse?.first?.discountValueCalculated == 0)
        XCTAssert(expectedResponse?.first?.tax == 0)
        XCTAssert(expectedResponse?.first?.taxValue == 0)
        XCTAssert(expectedResponse?.first?.totalValue == 0.0)
        XCTAssert(expectedResponse?.first?.subTotalValue == 0.0)
        XCTAssert(expectedResponse?.first?.items?.first?.name == "t-shirt1")
        XCTAssert(expectedResponse?.first?.items?.first?.description == "")
        XCTAssert(expectedResponse?.first?.items?.first?.quantity == 1)
        XCTAssert(expectedResponse?.first?.items?.first?.price == 1.0)
        
        XCTAssert(expectedResponse?.last?.invoiceNumber == "CIR_INV_1653569048600")
        XCTAssert(expectedResponse?.last?.customerMobile == "+201148379445")
        XCTAssert(expectedResponse?.last?.status == 0)
        XCTAssert(expectedResponse?.last?.createDate == "2022-05-26T12:44:08.000Z")
        XCTAssert(expectedResponse?.last?.dueDate == "2022-07-20T00:00:00.000Z")
        XCTAssert(expectedResponse?.last?.shippingFees == 5.0)
        XCTAssert(expectedResponse?.last?.discountValue == 10.0)
        XCTAssert(expectedResponse?.last?.discountType == "Percentage")
        XCTAssert(expectedResponse?.last?.discountValueCalculated == 10.0)
        XCTAssert(expectedResponse?.last?.tax == 20.0)
        XCTAssert(expectedResponse?.last?.taxValue == 20.0)
        XCTAssert(expectedResponse?.last?.totalValue == 0.0)
        XCTAssert(expectedResponse?.last?.subTotalValue == 0.0)
        XCTAssert(expectedResponse?.last?.items?.first?.name == "t-shirt1")
        XCTAssert(expectedResponse?.last?.items?.first?.description == "")
        XCTAssert(expectedResponse?.last?.items?.first?.quantity == 1)
        XCTAssert(expectedResponse?.last?.items?.first?.price == 200.0)
    }
    
    func listInvoiceStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("invoice/list") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let customerMobileCondition = req.url?.absoluteString.contains( "+201148379445") ?? false
            return urlCondition && methodCondition && customerMobileCondition
        }
    }
    
}
