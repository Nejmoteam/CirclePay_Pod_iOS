//
//  AddressDetailsView.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 22/05/2022.
//

import Foundation
import UIKit


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
    lazy var selectCountrySepratorView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary600.value
        return view
    }()
    
    lazy var selectCitySepratorView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary600.value
        return view
    }()
    
    lazy var ApartamentNumberSepratorView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary600.value
        return view
    }()
    
    lazy var selectCountryField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select Country"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.paddingLeftCustom = 16
        textField.paddingRightCustom = 16
        textField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return textField
    }()
    lazy var selectCityField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select City"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.paddingLeftCustom = 16
        textField.paddingRightCustom = 16
        return textField
    }()
    lazy var appartmentNumberField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Appartment Number"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.paddingLeftCustom = 16
        textField.paddingRightCustom = 16
        textField.backgroundColor = ColorTypes.GrayPrimary100.value
        return textField
    }()
    lazy var extraDetailsField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Extra Details"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.paddingLeftCustom = 16
        textField.paddingRightCustom = 16
        textField.backgroundColor = ColorTypes.GrayPrimary100.value
        return textField
    }()
    
    private lazy var selectCityArrowImage: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Arrow",
                                  in: Bundle(for: type(of:self)),
                                  compatibleWith: nil)
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private lazy var selectCountryArrowImage: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Arrow",
                                  in: Bundle(for: type(of:self)),
                                  compatibleWith: nil)
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.setupTitleLabel()
        self.setupContainerView()
        self.setupVStackView()
        self.setupSelectCountrySepratorView()
        self.setupSelectCitySepratorView()
        self.setupAppartamentSepratorView()
      //  self.setupSelectCityArrowImageView()
        self.setupSelectCountryArrowImageView()
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
            self.containerView.heightAnchor.constraint(equalToConstant: 72 + 72)
            
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
        
        self.vStackView.addArrangedSubview(self.selectCountryField)
        self.vStackView.addArrangedSubview(self.selectCityField)
        self.vStackView.addArrangedSubview(self.appartmentNumberField)
        self.vStackView.addArrangedSubview(self.extraDetailsField)
    }
    
    private func setupSelectCountrySepratorView() {
        self.addSubview(self.selectCountrySepratorView)
        NSLayoutConstraint.activate([
            self.selectCountrySepratorView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.selectCountrySepratorView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            self.selectCountrySepratorView.heightAnchor.constraint(equalToConstant: 1),
            self.selectCountrySepratorView.centerYAnchor.constraint(equalTo: self.selectCountryField.bottomAnchor)
        ])
    }
    
    private func setupSelectCitySepratorView() {
        self.addSubview(self.selectCitySepratorView)
        NSLayoutConstraint.activate([
            self.selectCitySepratorView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.selectCitySepratorView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            self.selectCitySepratorView.heightAnchor.constraint(equalToConstant: 1),
            self.selectCitySepratorView.centerYAnchor.constraint(equalTo: self.selectCityField.bottomAnchor)
        ])
    }
    
    private func setupAppartamentSepratorView() {
        self.addSubview(self.ApartamentNumberSepratorView)
        NSLayoutConstraint.activate([
            self.ApartamentNumberSepratorView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.ApartamentNumberSepratorView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            self.ApartamentNumberSepratorView.heightAnchor.constraint(equalToConstant: 1),
            self.ApartamentNumberSepratorView.centerYAnchor.constraint(equalTo: self.appartmentNumberField.bottomAnchor)
        ])
    }
    
    private func setupSelectCityArrowImageView() {
        self.addSubview(self.selectCityArrowImage)
        NSLayoutConstraint.activate([
            self.selectCityArrowImage.heightAnchor.constraint(equalToConstant: 7),
            self.selectCityArrowImage.widthAnchor.constraint(equalToConstant: 14),
            self.selectCityArrowImage.centerYAnchor.constraint(equalTo: self.selectCityField.centerYAnchor),
            self.selectCityArrowImage.trailingAnchor.constraint(equalTo: self.selectCityField.trailingAnchor, constant: -14)
        ])
    }
    
    private func setupSelectCountryArrowImageView() {
        self.addSubview(self.selectCountryArrowImage)
        NSLayoutConstraint.activate([
            self.selectCountryArrowImage.heightAnchor.constraint(equalToConstant: 7),
            self.selectCountryArrowImage.widthAnchor.constraint(equalToConstant: 14),
            self.selectCountryArrowImage.centerYAnchor.constraint(equalTo: self.selectCountryField.centerYAnchor),
            self.selectCountryArrowImage.trailingAnchor.constraint(equalTo: self.selectCountryField.trailingAnchor, constant: -14)
        ])
    }
}

