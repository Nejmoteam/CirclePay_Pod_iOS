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

class MerchantCreateModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_Create() {
        //GIVEN
        stub(condition: createMerchantStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "merchant_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIwOCwiaXNWZXJpZmllZCI6ZmFsc2UsInRva2VuIjoiIiwiZm9yZ2V0UGFzc3dvcmR0b2tlbiI6IiIsImdvb2dsZU9hdXRoSUQiOiIiLCJmYWNlYm9va09hdGhJZCI6IiIsImF1dGh5X2lkIjoiIiwic3RhdHVzIjoiMCIsImFkZHJlc3MiOiIiLCJidXNpbmVzc05hbWUiOiIiLCJmaXJzdE5hbWUiOiJzdHJpbmciLCJsYXN0TmFtZSI6InN0cmluZyIsImVtYWlsIjoiYWRlbG1vaGV5QGNpcmNsZXBheS5jb20iLCJtb2JpbGUiOiIrMjAxMDk3NjU0MzMzIiwiYnVzaW5lc3NBZGRyZXNzIjoiYWRlbCIsInVzZXJuYW1lIjpudWxsLCJ1cGRhdGVkQXQiOiIyMDIyLTA2LTIyVDE4OjQ4OjAzLjEyMloiLCJjcmVhdGVkQXQiOiIyMDIyLTA2LTIyVDE4OjQ4OjAzLjEyMloiLCJhcHBfbmFtZSI6IkNpcmNsZVBheSIsImlhdCI6MTY1NTkyMzY4M30.L9tqnTxIFx3e6USPMFSiiOdWDe_aXEQRFsjlXE8qBNk"
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: MerchantCreateCodable? = nil
        let fName = "adel"
        let lName = "mohy"
        let email = "adelmohey@circlepay.ai"
        let mobile = "+201097654386"
        let bName = "circle"
        let bAddress = "Cairo"
        let callBacK = "www.google.com"
        let expectation =  self.expectation(description: "Failed To Create Merchant")
        //WHEN
        CirclePay.merchants.createMerchant(firstName: fName, lastName: lName, email: email, mobileNumber: mobile, businessName: bName, businessAddress: bAddress, callbackURL: callBacK) { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.merchantToken == "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIwOCwiaXNWZXJpZmllZCI6ZmFsc2UsInRva2VuIjoiIiwiZm9yZ2V0UGFzc3dvcmR0b2tlbiI6IiIsImdvb2dsZU9hdXRoSUQiOiIiLCJmYWNlYm9va09hdGhJZCI6IiIsImF1dGh5X2lkIjoiIiwic3RhdHVzIjoiMCIsImFkZHJlc3MiOiIiLCJidXNpbmVzc05hbWUiOiIiLCJmaXJzdE5hbWUiOiJzdHJpbmciLCJsYXN0TmFtZSI6InN0cmluZyIsImVtYWlsIjoiYWRlbG1vaGV5QGNpcmNsZXBheS5jb20iLCJtb2JpbGUiOiIrMjAxMDk3NjU0MzMzIiwiYnVzaW5lc3NBZGRyZXNzIjoiYWRlbCIsInVzZXJuYW1lIjpudWxsLCJ1cGRhdGVkQXQiOiIyMDIyLTA2LTIyVDE4OjQ4OjAzLjEyMloiLCJjcmVhdGVkQXQiOiIyMDIyLTA2LTIyVDE4OjQ4OjAzLjEyMloiLCJhcHBfbmFtZSI6IkNpcmNsZVBheSIsImlhdCI6MTY1NTkyMzY4M30.L9tqnTxIFx3e6USPMFSiiOdWDe_aXEQRFsjlXE8qBNk")
       
        
    }
    
    func createMerchantStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/create") ?? false
            let methodCondition = req.method == HTTPMethod.post
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
