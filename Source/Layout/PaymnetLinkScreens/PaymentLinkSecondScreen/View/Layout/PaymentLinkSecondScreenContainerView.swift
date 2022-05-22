//
//  PaymentLinkSecondScreenContainerView.swift
//  Pods
//
//  Created Alchemist on 22/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class PaymentLinkSecondScreenContainerView: PaymentBaseClass {
    
    private lazy var logoView: LogoContainerView = {
        let logoContainer = LogoContainerView()
        logoContainer.translatesAutoresizingMaskIntoConstraints = false
        return logoContainer
    }()
    
    private lazy var stepsView: StepsView = {
        let stepsViewContainer = StepsView()
        stepsViewContainer.translatesAutoresizingMaskIntoConstraints = false
        return stepsViewContainer
    }()
    
    private lazy var paymentSummeryTitleContainer: TitleViewContainer = {
        let titleContainer = TitleViewContainer()
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.titleLabel.text = "Customer Data"
        titleContainer.titleLabel.font = UIFont(name: FontType.boldFont.name, size: 20)
        return titleContainer
    }()
    
    private lazy var fullDataView: FullNameDataView = {
       var container = FullNameDataView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var contactsView: ContactsView = {
       var container = ContactsView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var addressDetailsView: AddressDetailsView = {
       var container = AddressDetailsView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    
       
    var presenter: PaymentLinkSecondScreenPresenterProtocol
    
    init(presenter:PaymentLinkSecondScreenPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        self.addLogoImageView()
        self.addStepsView()
        self.addSummeryTitleContainerView()
        self.addFullDataView()
        self.addContactsView()
        self.addAddressDetailsView()
    }

    private func addLogoImageView() {
        self.logoView.heightAnchor.constraint(equalToConstant: 47 + 32).isActive = true
        self.vStackView.addArrangedSubview(self.logoView)
    }
    
    private func addStepsView() {
        self.stepsView.heightAnchor.constraint(equalToConstant: 24 + 32).isActive = true
        self.vStackView.addArrangedSubview(self.stepsView)
        
    }
    
    private func addSummeryTitleContainerView() {
        self.paymentSummeryTitleContainer.heightAnchor.constraint(equalToConstant: 24 + 17).isActive = true
        self.vStackView.addArrangedSubview(self.paymentSummeryTitleContainer)
        
    }
    
    private func addFullDataView() {
        self.fullDataView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.vStackView.addArrangedSubview(self.fullDataView)
        
    }
    
    private func addContactsView() {
        self.contactsView.heightAnchor.constraint(equalToConstant: 192).isActive = true
        self.vStackView.addArrangedSubview(self.contactsView)
        
    }
    
    private func addAddressDetailsView() {
        self.addressDetailsView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.vStackView.addArrangedSubview(self.addressDetailsView)
        
    }
    
    
    
}


class AddressDetailsView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = ColorTypes.GrayPrimary900.value
        label.text = "Address Details"
        label.font = UIFont(name: FontType.regularFont.name, size: 16)
        return label
    }()
    
    lazy var containerView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.layer.borderColor = ColorTypes.GrayPrimary600.value.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = ColorTypes.GrayPrimary100.value
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 1
        return stack
    }()
    lazy var sepratorView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary600.value
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightText
        self.setupTitleLabel()
        self.setupContainerView()
        self.setupVStackView()
        self.setupSepratorView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        self.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 16)
        
        ])
    }
    
    private func setupContainerView() {
        self.addSubview(self.containerView)
        
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.containerView.heightAnchor.constraint(equalToConstant: 72)

        ])
    }
    private func setupSepratorView() {
        self.addSubview(self.sepratorView)
        NSLayoutConstraint.activate([
            self.sepratorView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            self.sepratorView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.sepratorView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            self.sepratorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupVStackView() {
        self.containerView.addSubview(self.vStackView)
        
        NSLayoutConstraint.activate([
            self.vStackView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0),
            self.vStackView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0),
            self.vStackView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
            self.vStackView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0)

        ])
//        self.vStackView.addArrangedSubview(self.firstNameTextField)
//        self.vStackView.addArrangedSubview(self.lastNameTextField)
    }
    
}
