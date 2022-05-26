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
    
    lazy var createPaymentLink: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create PaymentLink", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(userPressedCreatePaymentLink), for: .touchUpInside)
        return button
    }()
    var invoiceNumber: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //invoiceNumber = "CIR_INV_1653564987377"
        self.setupButtons()
        
        

        
        
        
        //        CirclePay.invoices.listInvoices(customerMobile: "+201157818027") { invoiceList, err in
        //            if err == nil {
        //                invoiceList?.forEach({print($0)})
        //            }
        //        }
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
        let items = [Items(itemDescription: "Testing Description", itemnName: "Testing ItemName", itemPrice: 220, itemQuantity: 2), Items(itemDescription: "Testing Description 2", itemnName: "Testing ItemName 2", itemPrice: 140, itemQuantity: 4),Items(itemDescription: "Testing Description 3", itemnName: "Testing ItemName 3", itemPrice: 600, itemQuantity: 1)]
        
        
        self.view.showActivityIndicator(with: ._default, isUserInteractionEnabled: false, frame: self.view.frame, color: #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1))
        CirclePay.invoices.createInvoice(invoiceNumber: nil, items: items, customerMobile: "+201157818027", status: nil, createDate: nil, dueDate: "2022-6-6", prefPaymentMethod: nil, shippingFees: 15, discountValue: 2, discountType: .percentage,  tax: 5, taxValue: nil, shippingPolicy: "Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy Shipping policy", returnPolicy: "return Policy return Policy return Policy return Policyreturn Policyreturn Policy return Policy return Policy", extraNotes: "Extra Notes for this Invoice for testing") { createdInvoice, err in
            self.view.removeActivityIndicator()
            if err != nil {
                print(err)
            } else {
                print(createdInvoice)
                if let unwrappedInvoice = createdInvoice {
                    print(unwrappedInvoice.invoiceNumber)
                    self.invoiceNumber = unwrappedInvoice.invoiceNumber
                    self.createInvoice.setTitle("Execute Invoice", for: .normal)
                }
            }
        }
        
        //        CirclePay.invoices.createInvoice(items: items, customerMobile: "+201157818027", dueDate: "2022-6-6") { createdInvoice, err in
        //            self.view.removeActivityIndicator()
        //            if err != nil {
        //                print(err)
        //            } else {
        //                print(createdInvoice)
        //                if let unwrappedInvoice = createdInvoice {
        //                    print(unwrappedInvoice.invoiceNumber)
        //                    self.invoiceNumber = unwrappedInvoice.invoiceNumber
        //                    self.createInvoice.setTitle("Execute Invoice", for: .normal)
        //                }
        //            }
        //        }
    }
    
    @objc func userPressedCreatePaymentLink() {
        
        self.showLoading()
        CirclePay.excutePayment(with: .PaymentLink(paymentLinkUrl: ""))
    }
    
    func showLoading() {
        
    }
    func hideLoading() {
        
    }
    
    private func setupButtons() {
        self.view.addSubview(self.createInvoice)
        NSLayoutConstraint.activate([
            self.createInvoice.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -10),
            self.createInvoice.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.createInvoice.widthAnchor.constraint(equalToConstant: 150),
            self.createInvoice.heightAnchor.constraint(equalToConstant: 36)
            
        ])
        self.view.addSubview(self.createPaymentLink)
        NSLayoutConstraint.activate([
            self.createPaymentLink.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 10),
            self.createPaymentLink.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //            self.createPaymentLink.widthAnchor.constraint(equalToConstant: 150),
            self.createPaymentLink.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }
    
//    func getPaymentMethods() {
//        CirclePay.merchants.listPaymentGateways { paymenGetways, err in
//            if err == nil {
//                print(paymenGetways)
//                CirclePay.merchants.listPaymentMethods { merchantPaymentMethods, err in
//                    if err == nil {
//                        print(merchantPaymentMethods)
//                        var methods = [PaymentMethods]()
//
//                        merchantPaymentMethods?.forEach({ method in
//                            let name = paymenGetways?.filter({$0.id == method.gateWayId}).first?.name
//                            methods.append(PaymentMethods(paymentMethodId: method.id ?? "", paymentMethodName: method.name ?? "", paymentGetwayId: method.gateWayId ?? "", paymentGetwayName: name ?? ""))
//                        })
//                        methods.forEach({print($0.paymentMethodName , " By: " , $0.paymentGetwayName)})
//                    }
//                }
//            }
//        }
//    }
    
}


//AHMED KHALID
//1 - Payment Summary -> Get Invoice.
//2 - Payment Methods List -> Adding PaymentGetway Name
//3 - UI Configuration (Payment Link/ Invoice , merchantToken)
//4 - WebView URL -> Invoice Pay
//5 - Cuppon ENDPOINT -> OPEN API



//MARK:-

//Screen One -> Invoice ID
//
//1 - GetInvoice -> ID
// CustomerNumber -> GetCustomer
//2 - GetMerchant

//Invoice
//Merchant
//Customer







extension InitialViewController: CirclePayDelegete {
    func didGetErrorAtCheckoutProcess(error: CirclePayError) {
        print(error.errorMsg)
    }
    
    func didPaidTransactionSucsessfully(transactionId: String) {
    }
    
    func didGetErrorAtPayingTransaction(error: CirclePayError) {
        print(error.errorMsg)
    }
    

    
    
}
