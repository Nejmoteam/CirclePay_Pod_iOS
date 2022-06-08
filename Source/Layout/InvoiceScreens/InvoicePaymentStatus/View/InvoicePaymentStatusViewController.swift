//
//  InvoicePaymentStatusViewController.swift
//  Pods
//
//  Created apple on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoicePaymentStatusViewController: UIViewController, InvoicePaymentStatusViewProtocol {
    var presenter: InvoicePaymentStatusPresenterProtocol!
    lazy var containerView : InvoicePaymentStatusContainerView = {
        var view = InvoicePaymentStatusContainerView(presenter: self.presenter)
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
    
    func setupView(with status:InvoicePaymentStatus) {
        self.containerView.setupView(with: status)
    }
    
    private func dimissAllCheckOutEmbed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.dismissAll(animated: true)
        }
    }
}
