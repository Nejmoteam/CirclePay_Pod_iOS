//
//  PaymentLinkSecondScreenViewController.swift
//  Pods
//
//  Created Alchemist on 22/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class PaymentLinkSecondScreenViewController: UIViewController, PaymentLinkSecondScreenViewProtocol {
    var presenter: PaymentLinkSecondScreenPresenterProtocol!
    lazy var containerView : PaymentLinkSecondScreenContainerView = {
        var view = PaymentLinkSecondScreenContainerView(presenter: self.presenter)
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
}
