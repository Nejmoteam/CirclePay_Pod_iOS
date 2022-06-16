//
//  PaymentMethodsViewContainer.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 22/05/2022.
//

import Foundation
import UIKit

class PaymentMethodsViewContainer: UIView, UITableViewDataSource , UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = true
        tableView.isScrollEnabled = false
        tableView.allowsMultipleSelection = false
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.register(PaymentMethodCell.self, forCellReuseIdentifier: NSStringFromClass(PaymentMethodCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    let paymentMethodsName = ["Credit Card","Mobile Wallet","Cash On Delivery","Fawry"]
    let paymentGetwaysName = ["By.Paymob" , "By.Paymob", "By.CirclePay", "By.Fawry"]

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setupTableViewConstraints()
//    }
    var presenter: InvoiceSecondScreenPresenterProtocol?
    init(presenter: InvoiceSecondScreenPresenterProtocol?) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.setupTableViewConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewConstraints() {
        self.addSubview(self.tableView)
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32)

        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let unwrappedPresenter = self.presenter {
            return unwrappedPresenter.numberOfPaymentMethods()
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PaymentMethodCell.self), for: indexPath) as? PaymentMethodCell else {
            return UITableViewCell()
        }
        if let uiConfigs = CirclePay.uiConfigs {
            if let color = uiConfigs.color {
                cell.paymentSelectioanView.selectImage.tintColor = UIColor(hexString: color)
                cell.paymentSelectioanView.selectedPaymentMethodTintColor = UIColor(hexString: color)
                cell.paymentSelectioanView.selectedPaymentGetWayTingColor = UIColor(hexString: color).withAlphaComponent(0.5)
            }
        }
        
        if let unwrappedPresenter = self.presenter {
            unwrappedPresenter.configurePaymentMethodsCell(cell: cell, indexPath: indexPath)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? PaymentMethodCell {
            cell.paymentSelectioanView.isSelected = true
            if let unwrappedPresenter = self.presenter {
                unwrappedPresenter.didSelectPaymentMethod(at: indexPath)
            }
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? PaymentMethodCell {
            cell.paymentSelectioanView.isSelected = false
        }
    }
}
