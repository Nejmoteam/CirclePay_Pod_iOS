//
//  InvoiceDetailsContainerView.swift
//  Pods
//
//  Created apple on 25/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceDetailsContainerView: UIView {
    lazy var tableViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.shadowWithCorner(cornerRadius: 5, shadowRaduis: 2, shadowColor: #colorLiteral(red: 0.1921568627, green: 0.3921568627, blue: 0.9529411765, alpha: 0.08), opacity: 1, offset: CGSize(width: 1, height: 1))
        view.backgroundColor = ColorTypes.GrayPrimary100.value
        return view
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.register(InvoiceDetailsPaymentSammaryTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(InvoiceDetailsPaymentSammaryTableViewCell.self))
        table.register(InvoiceDetailsProductTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(InvoiceDetailsProductTableViewCell.self))
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.allowsSelection = false
        return table
    }()
    var presenter: InvoiceDetailsPresenterProtocol
    
    init(presenter:InvoiceDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        self.addSubViews()
        setupTableViewContainer()
        setupTableView()
    }
    private func addSubViews() {
        addSubview(tableViewContainer)
        tableViewContainer.addSubview(tableView)
    }
    
    private func setupTableViewContainer() {
        NSLayoutConstraint.activate([
            tableViewContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            tableViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            tableViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            tableViewContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    private func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: tableViewContainer.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: tableViewContainer.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: tableViewContainer.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: tableViewContainer.bottomAnchor)
        ])
    }
    
}
