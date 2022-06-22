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

class MerchantListModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_List() {
        //GIVEN
        stub(condition: ListMerchantStubCondition() ) { urlRequest in
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
                    ],
                    [
                        "first_name": "Noha",
                        "last_name": "Wrong base line",
                        "email": "noha@circlepay.ai",
                        "mobile_number": "+201338688755",
                        "business_name": "Test",
                        "business_address": "Test",
                        "status": "1",
                        "merchant_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mzc3LCJpc1ZlcmlmaWVkIjpmYWxzZSwidG9rZW4iOiIiLCJmb3JnZXRQYXNzd29yZHRva2VuIjoiIiwiZ29vZ2xlT2F1dGhJRCI6IiIsImZhY2Vib29rT2F0aElkIjoiIiwiYXV0aHlfaWQiOiIiLCJzdGF0dXMiOiIwIiwiYWRkcmVzcyI6IiIsImJ1c2luZXNzTmFtZSI6IiIsImZpcnN0TmFtZSI6Ik9yYW5nZSIsImxhc3ROYW1lIjoiVGVzdCBMaW5lIiwiZW1haWwiOiJub2hhcmFkaUBjaXJjbGVwYXkuYWkiLCJwYXNzd29yZCI6IiQyYSQwOCR0Q0huZlQxNy95VWV4MzNFUmVNTFEubnprMHJNazRJMHdDc3hKSkZYUmlpWjYyNVVOdjNtMiIsIm1vYmlsZSI6IiswMTIyODY4ODc1NSIsImJ1c2luZXNzQWRkcmVzcyI6Iktvcm5pc2ggRWwgbWFkZGkiLCJ1c2VybmFtZSI6bnVsbCwidXBkYXRlZEF0IjoiMjAyMi0wMi0xNlQxMTozNjo1MC4yMjVaIiwiY3JlYXRlZEF0IjoiMjAyMi0wMi0xNlQxMTozNjo1MC4yMjVaIiwiYXBwX25hbWUiOiJOb2hhIFJhZGkiLCJpYXQiOjE2NDUwMTE0MTB9.JTvhOJJwFIXwkr8bQK4icx564Ed0xHWf89e1lZ1xo9g"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: [MerchantCodable]? = nil
        let expectation =  self.expectation(description: "Failed To List Merchant")
        //WHEN
        CirclePay.merchants.getAllMerchants { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.firstName == "Etisalat")
        XCTAssert(expectedResponse?.first?.lastName == "Merchant-Quality")
        XCTAssert(expectedResponse?.first?.email == "noharadi@circlepay.ai")
        XCTAssert(expectedResponse?.first?.mobileNumber == "+201200020824")
        XCTAssert(expectedResponse?.first?.businessName == "Quality")
        XCTAssert(expectedResponse?.first?.businessAddress == "true")
        XCTAssert(expectedResponse?.first?.status == "1")
        XCTAssert(expectedResponse?.first?.merchantToken == "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImZpcnN0TmFtZSI6Ikhhc2VlYiB0ZXN0IiwibGFzdE5hbWUiOiJTYWlmIiwiZW1haWwiOiJ0aGlzRXJyb3JAZ21haWwuY29tIiwidXNlcm5hbWUiOm51bGwsInBhc3N3b3JkIjoiJDJhJDA4JGJLWndxMDlmVk5ITXBHYk1WanBpbk8yNWQzU3ZSSG9Ealk5eXF4WXdaLnNvSVBUTndFSTF1IiwiaXNWZXJpZmllZCI6ZmFsc2UsInRva2VuIjoiYzZlOGY3YWQ5YzMzZWY0MGIwZTcxNjM1Mjg4MDUwNTE5IiwiZm9yZ2V0UGFzc3dvcmR0b2tlbiI6Ijg3Y2M0MDllMmYzZDZlNjBkM2NiMTY0MzI3NTcwNDkwOCIsImdvb2dsZU9hdXRoSUQiOm51bGwsImZhY2Vib29rT2F0aElkIjpudWxsLCJwcm9maWxlUGhvdG8iOm51bGwsIm1vYmlsZSI6IisyMDU4NTMzMDgyNSIsImF1dGh5X2lkIjpudWxsLCJzdGF0dXMiOiIxIiwic2hpcHBpbmdQb2xpY3kiOm51bGwsInJlZnVuZFBvbGljeSI6bnVsbCwiYWRkcmVzcyI6bnVsbCwiYnVzaW5lc3NOYW1lIjoiQUJDIiwiYnVzaW5lc3NBZGRyZXNzIjoiQUJDIiwiY3JlYXRlZEF0IjoiMjAyMS0xMC0yNlQyMjo0MDo1MC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMS0yN1QwOToyODoyNS4wMDBaIiwiYXBwX25hbWUiOiJDaXJjbGVQYXkiLCJpYXQiOjE2NDQyMzQ1MTF9.qQxCF7PMWqNXzyx2DqgnZbx6tToCWDhhImY42MI3spA")
        
        XCTAssert(expectedResponse?.last?.firstName == "Noha")
        XCTAssert(expectedResponse?.last?.lastName == "Wrong base line")
        XCTAssert(expectedResponse?.last?.email == "noha@circlepay.ai")
        XCTAssert(expectedResponse?.last?.mobileNumber == "+201338688755")
        XCTAssert(expectedResponse?.last?.businessName == "Test")
        XCTAssert(expectedResponse?.last?.businessAddress == "Test")
        XCTAssert(expectedResponse?.last?.status == "1")
        XCTAssert(expectedResponse?.last?.merchantToken == "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mzc3LCJpc1ZlcmlmaWVkIjpmYWxzZSwidG9rZW4iOiIiLCJmb3JnZXRQYXNzd29yZHRva2VuIjoiIiwiZ29vZ2xlT2F1dGhJRCI6IiIsImZhY2Vib29rT2F0aElkIjoiIiwiYXV0aHlfaWQiOiIiLCJzdGF0dXMiOiIwIiwiYWRkcmVzcyI6IiIsImJ1c2luZXNzTmFtZSI6IiIsImZpcnN0TmFtZSI6Ik9yYW5nZSIsImxhc3ROYW1lIjoiVGVzdCBMaW5lIiwiZW1haWwiOiJub2hhcmFkaUBjaXJjbGVwYXkuYWkiLCJwYXNzd29yZCI6IiQyYSQwOCR0Q0huZlQxNy95VWV4MzNFUmVNTFEubnprMHJNazRJMHdDc3hKSkZYUmlpWjYyNVVOdjNtMiIsIm1vYmlsZSI6IiswMTIyODY4ODc1NSIsImJ1c2luZXNzQWRkcmVzcyI6Iktvcm5pc2ggRWwgbWFkZGkiLCJ1c2VybmFtZSI6bnVsbCwidXBkYXRlZEF0IjoiMjAyMi0wMi0xNlQxMTozNjo1MC4yMjVaIiwiY3JlYXRlZEF0IjoiMjAyMi0wMi0xNlQxMTozNjo1MC4yMjVaIiwiYXBwX25hbWUiOiJOb2hhIFJhZGkiLCJpYXQiOjE2NDUwMTE0MTB9.JTvhOJJwFIXwkr8bQK4icx564Ed0xHWf89e1lZ1xo9g")
        
    }
    
    func ListMerchantStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/list") ?? false
            let methodCondition = req.method == HTTPMethod.get
            return urlCondition && methodCondition
        }
    }
    
}
