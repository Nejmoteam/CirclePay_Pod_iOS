//
//  InvoiceListContainerView.swift
//  CirclePay_Pod_iOS
//
//  Created apple on 29/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceListContainerView: UIView {
    lazy var dismissButton : UIButton = {
        let button =  UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    var presenter: InvoiceListPresenterProtocol
    
    init(presenter:InvoiceListPresenterProtocol) {
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
        setupDismissButton()
        setupTableView()
    }
    private func addSubViews() {
        addSubview(dismissButton)
        addSubview(tableView)
    }
    
    private func setupDismissButton() {
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            dismissButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
    private func setupTableView(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func dismissView() {
        presenter.dismissView()
    }
    
}

extension InvoiceListContainerView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.cellTitle(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCell(at: indexPath)
    }
    
    
}
