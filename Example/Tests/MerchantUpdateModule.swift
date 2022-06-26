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

class MerchantUpdateModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_Update() {
        //GIVEN
        stub(condition: updateMerchantStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "first_name": "adel",
                        "last_name": "mohy",
                        "email": "adelmohey@circlepay.ai",
                        "mobile_number": "+201097654386",
                        "business_name": "circle",
                        "business_address": "Cairo",
                        "status": "1",
                        "merchant_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImZpcnN0TmFtZSI6Ikhhc2VlYiB0ZXN0IiwibGFzdE5hbWUiOiJTYWlmIiwiZW1haWwiOiJ0aGlzRXJyb3JAZ21haWwuY29tIiwidXNlcm5hbWUiOm51bGwsInBhc3N3b3JkIjoiJDJhJDA4JGJLWndxMDlmVk5ITXBHYk1WanBpbk8yNWQzU3ZSSG9Ealk5eXF4WXdaLnNvSVBUTndFSTF1IiwiaXNWZXJpZmllZCI6ZmFsc2UsInRva2VuIjoiYzZlOGY3YWQ5YzMzZWY0MGIwZTcxNjM1Mjg4MDUwNTE5IiwiZm9yZ2V0UGFzc3dvcmR0b2tlbiI6Ijg3Y2M0MDllMmYzZDZlNjBkM2NiMTY0MzI3NTcwNDkwOCIsImdvb2dsZU9hdXRoSUQiOm51bGwsImZhY2Vib29rT2F0aElkIjpudWxsLCJwcm9maWxlUGhvdG8iOm51bGwsIm1vYmlsZSI6IisyMDU4NTMzMDgyNSIsImF1dGh5X2lkIjpudWxsLCJzdGF0dXMiOiIxIiwic2hpcHBpbmdQb2xpY3kiOm51bGwsInJlZnVuZFBvbGljeSI6bnVsbCwiYWRkcmVzcyI6bnVsbCwiYnVzaW5lc3NOYW1lIjoiQUJDIiwiYnVzaW5lc3NBZGRyZXNzIjoiQUJDIiwiY3JlYXRlZEF0IjoiMjAyMS0xMC0yNlQyMjo0MDo1MC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMS0yN1QwOToyODoyNS4wMDBaIiwiYXBwX25hbWUiOiJDaXJjbGVQYXkiLCJpYXQiOjE2NDQyMzQ1MTF9.qQxCF7PMWqNXzyx2DqgnZbx6tToCWDhhImY42MI3spA"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: MerchantCodable? = nil
        let fName = "adel"
        let lName = "mohy"
        let email = "adelmohey@circlepay.ai"
        let mobile = "+201097654386"
        let bName = "circle"
        let bAddress = "Cairo"
        let callBacK = "www.google.com"
        let expectation =  self.expectation(description: "Failed To Update Merchant")
        //WHEN
        CirclePay.merchants.updateMerchant(firstName: fName, lastName: lName, email: email, mobileNumber: mobile, businessName: bName, businessAddress: bAddress, callbackURL: callBacK) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.firstName == "adel")
        XCTAssert(expectedResponse?.lastName == "mohy")
        XCTAssert(expectedResponse?.email == "adelmohey@circlepay.ai")
        XCTAssert(expectedResponse?.mobileNumber == "+201097654386")
        XCTAssert(expectedResponse?.businessName == "circle")
        XCTAssert(expectedResponse?.businessAddress == "Cairo")
        XCTAssert(expectedResponse?.status == "1")
        XCTAssert(expectedResponse?.merchantToken == "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImZpcnN0TmFtZSI6Ikhhc2VlYiB0ZXN0IiwibGFzdE5hbWUiOiJTYWlmIiwiZW1haWwiOiJ0aGlzRXJyb3JAZ21haWwuY29tIiwidXNlcm5hbWUiOm51bGwsInBhc3N3b3JkIjoiJDJhJDA4JGJLWndxMDlmVk5ITXBHYk1WanBpbk8yNWQzU3ZSSG9Ealk5eXF4WXdaLnNvSVBUTndFSTF1IiwiaXNWZXJpZmllZCI6ZmFsc2UsInRva2VuIjoiYzZlOGY3YWQ5YzMzZWY0MGIwZTcxNjM1Mjg4MDUwNTE5IiwiZm9yZ2V0UGFzc3dvcmR0b2tlbiI6Ijg3Y2M0MDllMmYzZDZlNjBkM2NiMTY0MzI3NTcwNDkwOCIsImdvb2dsZU9hdXRoSUQiOm51bGwsImZhY2Vib29rT2F0aElkIjpudWxsLCJwcm9maWxlUGhvdG8iOm51bGwsIm1vYmlsZSI6IisyMDU4NTMzMDgyNSIsImF1dGh5X2lkIjpudWxsLCJzdGF0dXMiOiIxIiwic2hpcHBpbmdQb2xpY3kiOm51bGwsInJlZnVuZFBvbGljeSI6bnVsbCwiYWRkcmVzcyI6bnVsbCwiYnVzaW5lc3NOYW1lIjoiQUJDIiwiYnVzaW5lc3NBZGRyZXNzIjoiQUJDIiwiY3JlYXRlZEF0IjoiMjAyMS0xMC0yNlQyMjo0MDo1MC4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMi0wMS0yN1QwOToyODoyNS4wMDBaIiwiYXBwX25hbWUiOiJDaXJjbGVQYXkiLCJpYXQiOjE2NDQyMzQ1MTF9.qQxCF7PMWqNXzyx2DqgnZbx6tToCWDhhImY42MI3spA")
        
        
    }
    
    func updateMerchantStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/update") ?? false
            let methodCondition = req.method == HTTPMethod.put
            if let httpBody = req.ohhttpStubs_httpBody {
                let bodyString = String.init(data: httpBody, encoding: String.Encoding.utf8)
                
                let filteredStringBody = bodyString?.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
                let bodyCondition = (filteredStringBody?.contains("first_name:adel"))! &&
                (filteredStringBody?.contains("last_name:mohy"))! &&
                (filteredStringBody?.contains("email:adelmohey@circlepay.ai"))! && (filteredStringBody?.contains("mobile_number:+201097654386"))! && (filteredStringBody?.contains("business_name:circle"))! &&
                (filteredStringBody?.contains("business_address:Cairo"))! &&
                (filteredStringBody?.contains("callback_url:www.google.com"))!
                return urlCondition && bodyCondition && methodCondition
            } else {
                return urlCondition && methodCondition
            }
        }
    }
    
}
