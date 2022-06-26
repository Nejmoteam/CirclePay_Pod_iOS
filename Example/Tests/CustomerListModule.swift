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

class CustomerListModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Cutomer_List() {
        //GIVEN
        stub(condition: listCustomerStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "first_name": "Mohamed",
                        "last_name": "Elbatawy",
                        "email": "eng.m.abdelhady95@gmail.com",
                        "mobile_number": "+20122435545",
                        "country": "Åland Islands",
                        "governorate": "nmjhk",
                        "city": "Benha",
                        "address": "Benha",
                        "apt_num": "32"
                    ],
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
        var expectedResponse: [CustomerCodable]? = nil
        
        let expectation =  self.expectation(description: "Failed To list Customers")
        //WHEN
        CirclePay.customers.listCustomers { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.firstName == "Mohamed")
        XCTAssert(expectedResponse?.first?.lastName == "Elbatawy")
        XCTAssert(expectedResponse?.first?.email == "eng.m.abdelhady95@gmail.com")
        XCTAssert(expectedResponse?.first?.mobileNumber == "+20122435545")
        XCTAssert(expectedResponse?.first?.country == "Åland Islands")
        XCTAssert(expectedResponse?.first?.governorate == "nmjhk")
        XCTAssert(expectedResponse?.first?.city == "Benha")
        XCTAssert(expectedResponse?.first?.address == "Benha")
        XCTAssert(expectedResponse?.first?.aptNumber == "32")
        
        XCTAssert(expectedResponse?.last?.firstName == "Noha")
        XCTAssert(expectedResponse?.last?.lastName == "Radi")
        XCTAssert(expectedResponse?.last?.email == "e@gmail.com")
        XCTAssert(expectedResponse?.last?.mobileNumber == "+201014163225")
        XCTAssert(expectedResponse?.last?.country == "Egypt")
        XCTAssert(expectedResponse?.last?.governorate == "Sharqia")
        XCTAssert(expectedResponse?.last?.city == "Zagazig")
        XCTAssert(expectedResponse?.last?.address == "Zagazig,Sharqia")
        XCTAssert(expectedResponse?.last?.aptNumber == "33")
    }
    
    func listCustomerStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("customer/list") ?? false
            let methodCondition = req.method == HTTPMethod.get
            return urlCondition && methodCondition
        }
    }
    
}
