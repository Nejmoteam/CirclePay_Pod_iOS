//
//  InvoiceFirstScreenViewController.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceFirstScreenViewController: UIViewController, InvoiceFirstScreenViewProtocol {
    
    var presenter: InvoiceFirstScreenPresenterProtocol!
    lazy var containerView : InvoiceFirstScreenContainerView = {
        var view = InvoiceFirstScreenContainerView(presenter: self.presenter)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.view = containerView
    }
    
    
    func configurePaymentSummery(billedFrom: String, billedTo: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.billedFromView.valueLabel.text = billedFrom
            self.containerView.billedToView.valueLabel.text = billedTo
            
        }
    }
    
    func configureSubTotal(subTotal: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.subTotalView.valueLabel.text = subTotal  + " EGP"
        }
    }
    
    
    func configureShipping(shippingValue: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.shippingView.valueLabel.text = shippingValue + " EGP"
        }
    }
    func configureDiscount(discountPercentage: String, value: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.discuntView.valueLabel.text = value + " EGP"
            self.containerView.discuntView.keyLabel.text = "Discount (\(discountPercentage))%"

        }

    }

    func configureInvoiceDate(date: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.invoiceDetails.productQuantityLabel.text = date
        }
    }
    
    func configureTaxView(taxValue: String, taxPersentage: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.taxView.keyLabel.text = "Tax (\(taxPersentage))%"
            self.containerView.taxView.valueLabel.text = taxValue + " EGP"
            
        }
    }
    
    func configureTotal(total: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.totalAmountView.keyValueViewContainer.valueLabel.text = total + " EGP"
        }
    }
    
    
}






