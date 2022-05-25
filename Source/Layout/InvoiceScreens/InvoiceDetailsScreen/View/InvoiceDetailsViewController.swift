//
//  InvoiceDetailsViewController.swift
//  Pods
//
//  Created apple on 25/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceDetailsViewController: UIViewController, InvoiceDetailsViewProtocol {
    var presenter: InvoiceDetailsPresenterProtocol!
    lazy var containerView : InvoiceDetailsContainerView = {
        var view = InvoiceDetailsContainerView(presenter: self.presenter)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        addTableHeaderView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        addTableHeaderView()
    }
    
    private func addTableHeaderView () {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let view = InoviceDetailsTableHeaderView()
            view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 36, height: 88)
            view.onCloseButtonClick = {
                self.presenter.dismissView()
            }
            self.containerView.tableView.tableHeaderView = view
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view = containerView
    }
}
