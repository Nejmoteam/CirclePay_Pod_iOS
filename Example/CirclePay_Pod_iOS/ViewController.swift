//
//  ViewController.swift
//  CirclePay_Pod_iOS
//
//  Created by adelmohey on 04/06/2022.
//  Copyright (c) 2022 adelmohey. All rights reserved.
//

import UIKit
import CirclePay_Pod_iOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CirclePay.merchants.sendOTP(countryCode: "+20", mobileNumber: "01117507878") { res, err in
            if err != nil {
                print(err)
            } else {
                print(res)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

