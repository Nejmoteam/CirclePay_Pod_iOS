//
//  MerchantCreateModule.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by apple on 22/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
import OHHTTPStubs
import Alamofire

class MerchantGetModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_Get() {
        //GIVEN
        stub(condition: getMerchantStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "first_name": "Etisalat",
                        "last_name": "Merchant-Quality",
                        "email": "noharadi@circlepay.ai",
                        "mobile_number": "+201200020824",
                        "business_name": "Quality",
                        "business_address": "true",
                        "status": "1",
                        "merchant_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImZpcnN0TmFtZSI6Ikhhc2VlYiB0ZXN0IiwibGFzdE5hbWUiOiJTYWlmIiwiZW1haWwiOiJ0aGlzRXJyb3JAZ21haWwuY29tIiwidXNlcm5hbWUiOm51bGwsInBhc3N3b3JkIjoiJDJhJDA4JGJLWndxMDlmVk5ITXBHYk1WanBpbk8yNWQzU3ZSSG9Ealk5eXF4WXdaLnNvSVBUTndFSTF1IiwiaXNWZXJpZmllZCI6ZmFsc2UsInRva2VuIjoiYzZlOGY3YWQ5YzMzZWY0MGIwZTcxNjM1Mjg4MDUwNTE5IiwiZm9yZ2V0UGFzc3dvcmR0b2tlbiI6Ijg3Y2M0MDllMmYzZDZlNjBkM2NiMTY0MzI3NTcwNDkwOCIsImdvb2dsZU9hdXRoSUQiOm51bGwsImZhY2Vib29rT2F0aElkIjpudWxsLCJwcm9maWxlUGhvdG8iOm51bGwsIm1vYmlsZSI6IisyMDU4NTMzMDgyNSIsImF1dGh5X2lkIjpudWxsLCJzdGF0dXMiOiIxIiwic2hpcHBpbmdQb2xpY3kiOm51bGwsInJlZnVuZFBvbGljeSI6bnVsbCwiYWRkcmVzcyI6bnVsbCwiYnVzaW5lc3NOYW1lIjoiQUJDIiwiYnVzaW5lc3NBZGRyZXNzIjoiQUJDIiwiY3JlYXRlZEF0IjoiMjAyMS0xMC0yNlQyMjo0MDo1MC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMS0yN1QwOToyODoyNS4wMDBaIiwiYXBwX25hbWUiOiJDaXJjbGVQYXkiLCJpYXQiOjE2NDQyMzQ1MTF9.qQxCF7PMWqNXzyx2DqgnZbx6tToCWDhhImY42MI3spA"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: MerchantCodable? = nil
        let expectation =  self.expectation(description: "Failed To Get Merchant")
        //WHEN
        CirclePay.merchants.getMerchant { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.firstName == "Etisalat")
        XCTAssert(expectedResponse?.lastName == "Merchant-Quality")
        XCTAssert(expectedResponse?.email == "noharadi@circlepay.ai")
        XCTAssert(expectedResponse?.mobileNumber == "+201200020824")
        XCTAssert(expectedResponse?.businessName == "Quality")
        XCTAssert(expectedResponse?.businessAddress == "true")
        XCTAssert(expectedResponse?.status == "1")
        XCTAssert(expectedResponse?.merchantToken == "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImZpcnN0TmFtZSI6Ikhhc2VlYiB0ZXN0IiwibGFzdE5hbWUiOiJTYWlmIiwiZW1haWwiOiJ0aGlzRXJyb3JAZ21haWwuY29tIiwidXNlcm5hbWUiOm51bGwsInBhc3N3b3JkIjoiJDJhJDA4JGJLWndxMDlmVk5ITXBHYk1WanBpbk8yNWQzU3ZSSG9Ealk5eXF4WXdaLnNvSVBUTndFSTF1IiwiaXNWZXJpZmllZCI6ZmFsc2UsInRva2VuIjoiYzZlOGY3YWQ5YzMzZWY0MGIwZTcxNjM1Mjg4MDUwNTE5IiwiZm9yZ2V0UGFzc3dvcmR0b2tlbiI6Ijg3Y2M0MDllMmYzZDZlNjBkM2NiMTY0MzI3NTcwNDkwOCIsImdvb2dsZU9hdXRoSUQiOm51bGwsImZhY2Vib29rT2F0aElkIjpudWxsLCJwcm9maWxlUGhvdG8iOm51bGwsIm1vYmlsZSI6IisyMDU4NTMzMDgyNSIsImF1dGh5X2lkIjpudWxsLCJzdGF0dXMiOiIxIiwic2hpcHBpbmdQb2xpY3kiOm51bGwsInJlZnVuZFBvbGljeSI6bnVsbCwiYWRkcmVzcyI6bnVsbCwiYnVzaW5lc3NOYW1lIjoiQUJDIiwiYnVzaW5lc3NBZGRyZXNzIjoiQUJDIiwiY3JlYXRlZEF0IjoiMjAyMS0xMC0yNlQyMjo0MDo1MC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMS0yN1QwOToyODoyNS4wMDBaIiwiYXBwX25hbWUiOiJDaXJjbGVQYXkiLCJpYXQiOjE2NDQyMzQ1MTF9.qQxCF7PMWqNXzyx2DqgnZbx6tToCWDhhImY42MI3spA")
        
    }
    
    func getMerchantStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/get") ?? false
            let methodCondition = req.method == HTTPMethod.get
            return urlCondition && methodCondition
        }
    }
    
}
