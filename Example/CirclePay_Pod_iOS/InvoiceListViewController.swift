//
//  InvoiceListViewController.swift
//  CirclePay_Pod_iOS
//
//  Created apple on 29/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceListViewController: UIViewController, InvoiceListViewProtocol {
    var presenter: InvoiceListPresenterProtocol!
    lazy var containerView : InvoiceListContainerView = {
        var view = InvoiceListContainerView(presenter: self.presenter)
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
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.tableView.reloadData()
        }
    }
}
