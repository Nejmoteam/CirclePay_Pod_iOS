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
    
    lazy var createInvoice: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Invoice", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(userPressedCreateInvoice), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.createInvoice)
        NSLayoutConstraint.activate([
            self.createInvoice.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.createInvoice.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.createInvoice.widthAnchor.constraint(equalToConstant: 150),
            self.createInvoice.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func userPressedCreateInvoice() {
//        let items = [Items(itemDescription: "Chair", itemnName: "X Chair", itemPrice: 220, itemQuantity: 2)]
//        CirclePay.invoices.createInvoice(items: items, customerMobile: "+201157818027", dueDate: "2022-6-6") { createdInvoice, err in
//            if err != nil {
//                print(err)
//            } else {
//                print(createdInvoice)
//                if let unwrappedInvoice = createdInvoice {
//                    print(unwrappedInvoice.invoiceNumber)
//                }
//
//            }
//        }
        
//        CirclePay.invoices.listInvoices(customerMobile: "+201157818027") { invoicesForCustomer, err in
//            if err != nil {
//                print(err)
//            } else {
//                print(invoicesForCustomer?.count)
//            }
//        }
    }
    
}

