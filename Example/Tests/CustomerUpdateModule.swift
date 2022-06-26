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

class CustomerUpdateModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Cutomer_Update() {
        //GIVEN
        stub(condition: updateCustomerStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "customer_mobile_number": "+201097654386"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: UpdateCustomerCodable? = nil
        let fName = "adel"
        let lName = "mohy"
        let email = "adelmohey@circlepay.ai"
        let mobile = "+201097654386"
        let country = "egypt"
        let address = "Cairo"
        let governorate = "Cairo"
        let city = "Cairo"
        let apt = "7"
        let expectation =  self.expectation(description: "Failed To Update Customer")
        //WHEN
        CirclePay.customers.updateCustomer(firstName: fName, lastName: lName, address: address, country: country, governorate: governorate, city: city, aptNumber: apt, email: email, mobileNumber: mobile) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.customerMobileNumber == "+201097654386")
       
        
    }
    
    func updateCustomerStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("customer/update") ?? false
            let methodCondition = req.method == HTTPMethod.put
            if let httpBody = req.ohhttpStubs_httpBody {
                let bodyString = String.init(data: httpBody, encoding: String.Encoding.utf8)
                
                let filteredStringBody = bodyString?.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
                let bodyCondition = (filteredStringBody?.contains("first_name:adel"))! &&
                (filteredStringBody?.contains("last_name:mohy"))! &&
                (filteredStringBody?.contains("email:adelmohey@circlepay.ai"))! && (filteredStringBody?.contains("mobile_number:+201097654386"))! && (filteredStringBody?.contains("country:egypt"))! &&
                (filteredStringBody?.contains("address:Cairo"))! &&
                (filteredStringBody?.contains("governorate:Cairo"))! &&
                (filteredStringBody?.contains("city:Cairo"))! &&
                (filteredStringBody?.contains("apt_num:7"))!
                return urlCondition && bodyCondition && methodCondition
            } else {
                return urlCondition && methodCondition
            }
        }
    }
    
}
