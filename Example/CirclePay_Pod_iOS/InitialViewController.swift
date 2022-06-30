//
//  ViewController.swift
//  CirclePay_Pod_iOS
//
//  Created by adelmohey on 04/06/2022.
//  Copyright (c) 2022 adelmohey. All rights reserved.
//

import UIKit
import CirclePay_Pod_iOS

class InitialViewController: UIViewController {
    
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
    
    lazy var invoicesList: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Invoices List", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(userPressedInvoicesList), for: .touchUpInside)
        return button
    }()
    var invoiceNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        invoiceNumber = "CIR_INV_1655839782096"
        self.setupButtons()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func userPressedCreateInvoice() {
        if let unwrappedInvoiceNumber = self.invoiceNumber {
            CirclePay.delegete = self
            CirclePay.excutePayment(with: .Invoice(invoiceNumber: unwrappedInvoiceNumber))
            return
        }
        
        let items = [Items(itemDescription: "Testing Description", itemnName: "Testing ItemName", itemPrice: 100, itemQuantity: 3), Items(itemDescription: "Testing Description 2", itemnName: "Testing ItemName 2", itemPrice: 200, itemQuantity: 2),Items(itemDescription: "Testing Description 3", itemnName: "Testing ItemName 3", itemPrice: 260, itemQuantity: 1)]
        
        
        self.view.showActivityIndicator(with: ._default, isUserInteractionEnabled: false, frame: self.view.frame, color: #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1))
        CirclePay.invoices.createInvoice(invoiceNumber: nil, items: items, customerMobile: "+201061140960", status: 0, createDate: nil, dueDate: "2022-7-30", prefPaymentMethod: nil, shippingFees: 15, discountValue: 2, discountType: .percentage,  tax: 5, taxValue: nil, shippingPolicy: "Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy", returnPolicy: "return Policy return Policy return Policy return Policyreturn Policyreturn Policy return Policy return Policy", extraNotes: "Extra Notes for this Invoice for testing") { createdInvoice, err in
            self.view.removeActivityIndicator()
            if err != nil {
            } else {
                // print(createdInvoice)
                if let unwrappedInvoice = createdInvoice {
                    //  print(unwrappedInvoice.invoiceNumber)
                    self.invoiceNumber = unwrappedInvoice.invoiceNumber
                    self.createInvoice.setTitle("Execute Invoice", for: .normal)
                }
            }
        }
        
    }
    
    @objc func userPressedInvoicesList() {
        // TO Invoices List
        let invoiceListVC = InvoiceListRouter.createAnModule()
        invoiceListVC.modalPresentationStyle  = .overFullScreen
        self.present(invoiceListVC, animated: true, completion: nil)
    }
    
    
    private func setupButtons() {
        self.view.addSubview(self.createInvoice)
        NSLayoutConstraint.activate([
            self.createInvoice.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -10),
            self.createInvoice.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.createInvoice.widthAnchor.constraint(equalToConstant: 150),
            self.createInvoice.heightAnchor.constraint(equalToConstant: 36)
            
        ])
        self.view.addSubview(self.invoicesList)
        NSLayoutConstraint.activate([
            self.invoicesList.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 10),
            self.invoicesList.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.invoicesList.widthAnchor.constraint(equalToConstant: 200),
            self.invoicesList.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }
}





extension InitialViewController: CirclePayDelegete {
    
    func didGetErrorAtCheckoutProcess(error: CirclePayError) {
        print("Check out error :- " , error.errorMsg ?? "Can't get err msg")
    }
    
    func didPaidTransactionSucsessfully(transaction: TransactionResult) {
        print("Sucsessfully Paid :-", transaction)
    }
    
    func didGetErrorAtPayingTransaction(transaction: TransactionResult, error: CirclePayError) {
        print("Failed to Pay :-", transaction)
    }
    
}


