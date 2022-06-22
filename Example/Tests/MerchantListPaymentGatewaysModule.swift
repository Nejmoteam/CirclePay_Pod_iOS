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

class MerchantListPaymentGatewaysModule: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_Merchant_list_payment_gateway() {
        //GIVEN
        stub(condition: ListMerchantPaymentGatewaysStubCondition() ) { urlRequest in
            let httpHeader =  ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
            let jsonResponse: [String: Any] = [
                "message":"",
                "details":"",
                "data": [
                    [
                        "id": "610b2c486df621209c85215a",
                        "name": "MyFatoorah",
                        "status": true,
                        "config": [
                            "id": 1.0,
                            "apiKey": "RY6GXFd6KJKBZ98PHPLJOpmXthqkppqM3FF79cbUhv_MACpIAQ4LD3R5MemgqnA3BgVtEa-NeIItV4fFawY4XalaXuRKqcYM2MXIaYbvJnudshMQSOrQwWcvetktUzdNxQxUsoPAu6vEKlynpVkf0VYqr-9SLYSfvxKiMe6rnqGmtwMC5fcUdkfgrVznxCTr4B7dqQX09vU1_YC_gFzLxQPTP5z3Juum1JAxxv8kJ7RShclqMcWM_g2tNWzy3omqGqUflWobBBe3ebdiLtIF9pzYTqOvHsVi6k9HM6AnKR79hTQbfVICTacdhvNGKhy6HbjsaShDfI6gg4DgZ5dBjOboth9lPtqSb2OBB_3vbvUjyeOa71I5DbyEWx4Nx96luiybyvjf0ig8_yAs5HeuPz2BPPeglaila0fhW79KsKfMs9CBjKLDsJJ4EPMR6TALwefsBebOPLX6fqUvYzAuu4T8lUTAl1LlV_QeI1sc6IAc5KmkHzodRw-lQdq201a9SG6qfOH61QP_hQwS98tObIdBqQAhu2_oMNDOhYQ9kTVrSgQTrCkYTmhDI3xTp8TA09OtH7I80g-gUVf_y_zYEbJXomFVrRcPHHrt9tl1DJ9wAiaL6P9o1QrEVf7zAmLn8FedgGLdeBjOcIFjcCCQd0eLQZxTC7krBHYAXZeZbW0-RfaD",
                            "signature": "",
                            "merchantCode": "",
                            "merchantRefNum": ""
                        ]
                    ],
                    [
                        "id": "610b2c486df621209c85215b",
                        "name": "PayMob",
                        "status": true,
                        "config": [
                            "CARD": [
                                "iframeID": "43010",
                                "integrationID": "33483"
                            ],
                            "CASH": [
                                "iframeID": "",
                                "integrationID": ""
                            ],
                            "ValU": [
                                "iframeIDVal": "372659",
                                "integrationIDVal": "1998383"
                            ],
                            "Kiosk": [
                                "iframeID": "",
                                "integrationID": "107439"
                            ],
                            "Wallet": [
                                "iframeID": "",
                                "integrationID": "104351"
                            ],
                            "apiKey": "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRRNE56RXNJbTVoYldVaU9pSXhOalV4TVRBeU1qTXpMall3TlRVek1pSjkudEhoZS0yZHk2YTZSVFZHaUJBRmZ2M2xORl9JaUxLWDQ0eHM0MXIyTXdWRHNsZm83VUtBVzVCckctSGFlLW5HSG1XYTBwbzh0V1FoczF2bnV0aEE1cnc=",
                            "SUHOOLA": [
                                "iframeID": "326757",
                                "integrationID": "33483"
                            ]
                        ]
                    ]
                ]
            ]
            return HTTPStubsResponse(jsonObject: jsonResponse, statusCode: 200, headers: httpHeader)
        }
        var expectedResponse: [MerchantPaymentGatewayCodable]? = nil
        let expectation =  self.expectation(description: "Failed To list Merchant payment gateways")
        //WHEN
        CirclePay.merchants.listPaymentGateways { model, error in
            expectedResponse = model
            expectation.fulfill()
        }
        //THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)
        XCTAssert(expectedResponse?.first?.id == "610b2c486df621209c85215a")
        XCTAssert(expectedResponse?.first?.name == "MyFatoorah")
        XCTAssert(expectedResponse?.first?.status == true)
        XCTAssert(expectedResponse?.first?.config?.apiKey == "RY6GXFd6KJKBZ98PHPLJOpmXthqkppqM3FF79cbUhv_MACpIAQ4LD3R5MemgqnA3BgVtEa-NeIItV4fFawY4XalaXuRKqcYM2MXIaYbvJnudshMQSOrQwWcvetktUzdNxQxUsoPAu6vEKlynpVkf0VYqr-9SLYSfvxKiMe6rnqGmtwMC5fcUdkfgrVznxCTr4B7dqQX09vU1_YC_gFzLxQPTP5z3Juum1JAxxv8kJ7RShclqMcWM_g2tNWzy3omqGqUflWobBBe3ebdiLtIF9pzYTqOvHsVi6k9HM6AnKR79hTQbfVICTacdhvNGKhy6HbjsaShDfI6gg4DgZ5dBjOboth9lPtqSb2OBB_3vbvUjyeOa71I5DbyEWx4Nx96luiybyvjf0ig8_yAs5HeuPz2BPPeglaila0fhW79KsKfMs9CBjKLDsJJ4EPMR6TALwefsBebOPLX6fqUvYzAuu4T8lUTAl1LlV_QeI1sc6IAc5KmkHzodRw-lQdq201a9SG6qfOH61QP_hQwS98tObIdBqQAhu2_oMNDOhYQ9kTVrSgQTrCkYTmhDI3xTp8TA09OtH7I80g-gUVf_y_zYEbJXomFVrRcPHHrt9tl1DJ9wAiaL6P9o1QrEVf7zAmLn8FedgGLdeBjOcIFjcCCQd0eLQZxTC7krBHYAXZeZbW0-RfaD")
        
        XCTAssert(expectedResponse?.last?.id == "610b2c486df621209c85215b")
        XCTAssert(expectedResponse?.last?.name == "PayMob")
        XCTAssert(expectedResponse?.last?.status == true)
        XCTAssert(expectedResponse?.last?.config?.apiKey == "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRRNE56RXNJbTVoYldVaU9pSXhOalV4TVRBeU1qTXpMall3TlRVek1pSjkudEhoZS0yZHk2YTZSVFZHaUJBRmZ2M2xORl9JaUxLWDQ0eHM0MXIyTXdWRHNsZm83VUtBVzVCckctSGFlLW5HSG1XYTBwbzh0V1FoczF2bnV0aEE1cnc=")
        
    }
    
    func ListMerchantPaymentGatewaysStubCondition() -> HTTPStubsTestBlock {
        return { req in
            let urlCondition = req.url?.absoluteString.contains("merchants/payment/gateway/list") ?? false
            let methodCondition = req.method == HTTPMethod.get
            return urlCondition && methodCondition
        }
    }
    
}
