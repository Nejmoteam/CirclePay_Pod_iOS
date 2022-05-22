//
//  ContactsView.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 22/05/2022.
//

import Foundation
import UIKit
class ContactsView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = ColorTypes.GrayPrimary900.value
        label.text = "Contacts"
        label.font = UIFont(name: FontType.regularFont.name, size: 16)
        return label
    }()
    
    lazy var containerView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.layer.borderColor = ColorTypes.GrayPrimary600.value.cgColor
        view.backgroundColor = ColorTypes.GrayPrimary100.value
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    lazy var sepratorView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary600.value
        return view
    }()
    
    lazy var phoneTextFieldView: PhoneContainerView = {
        let textField = PhoneContainerView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "user@email.com"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.paddingLeftCustom = 16
        textField.paddingRightCustom = 16
        return textField
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
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
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
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
        self.vStackView.addArrangedSubview(self.phoneTextFieldView)
        self.vStackView.addArrangedSubview(self.emailTextField)
    }
}


