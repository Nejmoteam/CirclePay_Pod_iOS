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
}
