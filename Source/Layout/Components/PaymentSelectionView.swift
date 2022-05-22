//
//  PaymentSelectionView.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 22/05/2022.
//

import Foundation
import UIKit


class PaymentSelectionView: UIView {
    lazy var selectImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "UnSelectedIcon",
                                  in: Bundle(for: type(of:self)),
                                  compatibleWith: nil)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var paymentMethodName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontType.mediumFont.name, size: 14)
        label.textColor = ColorTypes.GrayPrimary700.value
        return label
    }()
    
    lazy var paymentGatewayName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontType.regularFont.name, size: 12)
        label.textColor = ColorTypes.GrayPrimary600.value
        return label
    }()
    
    lazy var paymentMethodIconStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    var isSelected = false {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                if self.isSelected {
                    self.selectImage.image = UIImage(named: "SelectedIcon",
                                                     in: Bundle(for: type(of:self)),
                                                     compatibleWith: nil)
                    self.paymentMethodName.textColor = ColorTypes.PrimaryMain700.value
                    self.paymentGatewayName.textColor = ColorTypes.PrimaryMain400.value
                } else {
                    self.selectImage.image = UIImage(named: "UnSelectedIcon",
                                                     in: Bundle(for: type(of:self)),
                                                     compatibleWith: nil)
                    self.paymentMethodName.textColor = ColorTypes.GrayPrimary700.value
                    self.paymentGatewayName.textColor = ColorTypes.GrayPrimary600.value
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUserInterface()
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterface() {
        addSubviews()
        setupSelectImageConstraints()
        setupPaymentMethodNameConstraints()
        setupPaymentGatewayConstraints()
        setupPaymentMethodIconStackConstraints()
    }
    
    private func addSubviews() {
        addSubview(selectImage)
        addSubview(paymentMethodName)
        addSubview(paymentGatewayName)
        addSubview(paymentMethodIconStack)
    }
    
    private func setupSelectImageConstraints() {
        NSLayoutConstraint.activate([
            selectImage.widthAnchor.constraint(equalToConstant: 24),
            selectImage.heightAnchor.constraint(equalToConstant: 24),
            selectImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    private func setupPaymentMethodNameConstraints() {
        NSLayoutConstraint.activate([
            paymentMethodName.heightAnchor.constraint(equalToConstant: 23),
            paymentMethodName.leadingAnchor.constraint(equalTo: selectImage.trailingAnchor, constant: 10),
            paymentMethodName.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupPaymentGatewayConstraints() {
        NSLayoutConstraint.activate([
            paymentGatewayName.heightAnchor.constraint(equalToConstant: 16),
            paymentGatewayName.leadingAnchor.constraint(equalTo: paymentMethodName.trailingAnchor, constant: 10),
            paymentGatewayName.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupPaymentMethodIconStackConstraints() {
        NSLayoutConstraint.activate([
            paymentMethodIconStack.heightAnchor.constraint(equalToConstant: 20),
            paymentMethodIconStack.leadingAnchor.constraint(greaterThanOrEqualTo: paymentGatewayName.trailingAnchor, constant: 10),
            paymentMethodIconStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            paymentMethodIconStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
