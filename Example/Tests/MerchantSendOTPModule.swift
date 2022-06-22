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

class MerchantSendOTPModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_Send_OTP() {
        //GIVEN
        stub(condition: sendOTPMerchantStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "status": "true"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: MerchantSendOTPCodable? = nil
        let expectation =  self.expectation(description: "Failed To send otp Merchant")
        let countryCode = "+20"
        let mobileNumber = "+201097654386"
        //WHEN
        CirclePay.merchants.sendOTP(countryCode: countryCode, mobileNumber: mobileNumber) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.status == "true")
    }
    
    func sendOTPMerchantStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/send/otp") ?? false
            let methodCondition = req.method == HTTPMethod.post
            if let httpBody = req.ohhttpStubs_httpBody {
                let bodyString = String.init(data: httpBody, encoding: String.Encoding.utf8)
                
                let filteredStringBody = bodyString?.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
                let bodyCondition = (filteredStringBody?.contains("country_code:+20"))! &&
                (filteredStringBody?.contains("mobile_number:+201097654386"))!
                return urlCondition && bodyCondition && methodCondition
            } else {
                return urlCondition && methodCondition
            }
        }
    }
    
}
