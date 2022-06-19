//
//  InvoiceFirstScreenPresenterTest.swift
//  CirclePay_Pod_iOS_Tests
//
//  Created by Alchemist on 19/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest
import CirclePay_Pod_iOS
class CirclePayTests: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    override class func tearDown() {
        super.tearDown()
    }
    
    func testMerchantToken() {
        let merchantToken = "Merchant Token"
        CirclePay.merchantToken = merchantToken
        
    }

}
