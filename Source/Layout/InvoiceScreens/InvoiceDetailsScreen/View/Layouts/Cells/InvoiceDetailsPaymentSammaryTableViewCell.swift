//
//  InvoiceDetailsPaymentSammaryTableViewCell.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 25/05/2022.
//

import Foundation
import UIKit


class InvoiceDetailsPaymentSammaryTableViewCell: UITableViewCell {
    lazy var vStackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    
    private lazy var paymentSummeryTitleContainer: TitleViewContainer = {
        let titleContainer = TitleViewContainer()
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.titleLabel.text = "Payment Summery"
        titleContainer.titleLabel.font = UIFont(name: FontType.mediumFont.name, size: 18)
        return titleContainer
    }()
    
    private lazy var billedFromView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Billed From :")
        container.valueLabel.text = "Mahmoud Allam"
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var billedToView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Billed To :")
        container.valueLabel.text = "CirclePay Inc"
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var totalAmountView: TotalAmountViewContainer = {
        var container = TotalAmountViewContainer()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var subTotalView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Sub Total :")
        container.valueLabel.text = "120 EGP"
        container.keyLabel.font = UIFont(name: FontType.regularFont.name, size: 16)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var taxView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Tax (14%) :")
        container.valueLabel.text = "45 EGP"
        container.keyLabel.font = UIFont(name: FontType.regularFont.name, size: 16)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var shippingView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Shipping :")
        container.valueLabel.text = "35 EGP"
        container.keyLabel.font = UIFont(name: FontType.regularFont.name, size: 16)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var discountView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Discount (5%) :")
        container.valueLabel.text = "120 EGP"
        container.keyLabel.font = UIFont(name: FontType.regularFont.name, size: 16)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var bottomSeprator: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary500.value
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        layoutUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterface() {
        addSubviews()
        setupVStackView()
        addSummeryTitleContainerView()
        setupBilledFromView()
        setupBilledToView()
        setupTotalAmountView()
        setupSubTotalView()
        setupTaxView()
        setupShippingView()
        setupDiscountView()
        setupBottomSeprator()
    }
    
    private func addSubviews() {
        contentView.addSubview(vStackView)
        contentView.addSubview(bottomSeprator)
    }
    
    private func setupVStackView() {
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func addSummeryTitleContainerView() {
        self.paymentSummeryTitleContainer.heightAnchor.constraint(equalToConstant: 24 + 17).isActive = true
        self.vStackView.addArrangedSubview(self.paymentSummeryTitleContainer)
        
    }
    
    private func setupBilledFromView() {
        
        self.billedFromView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.billedFromView)
        
    }
    
    private func setupBilledToView() {
        self.billedToView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.vStackView.addArrangedSubview(self.billedToView)
    }
    
    private func setupTotalAmountView() {
        self.totalAmountView.heightAnchor.constraint(equalToConstant: 86).isActive = true
        self.vStackView.addArrangedSubview(self.totalAmountView)
    }
    
    
    
    private func setupSubTotalView() {
        self.subTotalView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.subTotalView)
    }
    
    private func setupTaxView() {
        self.taxView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.taxView)
    }
    
    private func setupShippingView() {
        self.shippingView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.shippingView)
    }
    
    private func setupDiscountView() {
        self.discountView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.discountView)
    }
    
    private func setupBottomSeprator() {
        NSLayoutConstraint.activate([
            bottomSeprator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            bottomSeprator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            bottomSeprator.heightAnchor.constraint(equalToConstant: 1),
            bottomSeprator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
