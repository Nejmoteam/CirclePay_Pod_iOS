//
//  CustomerUpdateModule.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 26/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class CustomerGetModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Cutomer_Get() {
        //GIVEN
        stub(condition: listCustomerStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "first_name": "Noha",
                        "last_name": "Radi",
                        "email": "e@gmail.com",
                        "mobile_number": "+201014163225",
                        "country": "Egypt",
                        "governorate": "Sharqia",
                        "city": "Zagazig",
                        "address": "Zagazig,Sharqia",
                        "apt_num": "33"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: CustomerCodable? = nil
        
        let expectation =  self.expectation(description: "Failed To Get Customer")
        let mobile = "+201014163225"
        //WHEN
        CirclePay.customers.getCustomer(mobileNumber: mobile) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        
        XCTAssert(expectedResponse?.firstName == "Noha")
        XCTAssert(expectedResponse?.lastName == "Radi")
        XCTAssert(expectedResponse?.email == "e@gmail.com")
        XCTAssert(expectedResponse?.mobileNumber == "+201014163225")
        XCTAssert(expectedResponse?.country == "Egypt")
        XCTAssert(expectedResponse?.governorate == "Sharqia")
        XCTAssert(expectedResponse?.city == "Zagazig")
        XCTAssert(expectedResponse?.address == "Zagazig,Sharqia")
        XCTAssert(expectedResponse?.aptNumber == "33")
    }
    
    func listCustomerStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("customer/get") ?? false
            let methodCondition = req.method == HTTPMethod.get
            let mobileNumber = req.url?.absoluteString.contains("+201014163225") ?? false
            return urlCondition && methodCondition && mobileNumber
        }
    }
    
}
