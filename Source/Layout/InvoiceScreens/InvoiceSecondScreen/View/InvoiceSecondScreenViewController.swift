//
//  InvoiceSecondScreenViewController.swift
//  Pods
//
//  Created Alchemist on 24/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceSecondScreenViewController: UIViewController, InvoiceSecondScreenViewProtocol {
    var presenter: InvoiceSecondScreenPresenterProtocol!
    lazy var containerView : InvoiceSecondScreenContainerView = {
        var view = InvoiceSecondScreenContainerView(presenter: self.presenter)
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
    
    func reloadPaymentMethodsData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.injectPaymentMethodView()
            self.containerView.paymentMethodsView.tableView.reloadData()
        }
    }
    
    func setupCustomerData(customer: CustomerViewModel) {
        self.containerView.setupCustomerData(customer: customer)
    }
}
