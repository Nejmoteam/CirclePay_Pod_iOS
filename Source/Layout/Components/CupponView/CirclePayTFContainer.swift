//
//  CirclePayTFContainer.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit

class CirclePayTFContainer: UIView {
    lazy var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()

    lazy var showSecure: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = ColorTypes.GrayPrimary600.value
        button.isHidden = true
     //   button.setImage(#imageLiteral(resourceName: "eye"), for: .normal)
        button.addTarget(self, action: #selector(toggleSecureText), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 19).isActive = true
        return button
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = ColorTypes.MobilePrimary400.value
//        textField.font = UIFont(name: FontType.mediumFont.name, size: 16)
        textField.addTarget(self, action: #selector(textFieldEdidtingDidChange(_:)), for: .editingChanged)
        return textField
    }()

    var isSpacesEnabled: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUserInterface()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterface() {
        addSubviews()
        setupTextFieldConstraints()
    }

    private func addSubviews() {
        horizontalStack.addArrangedSubview(textField)
        horizontalStack.addArrangedSubview(showSecure)
        addSubview(horizontalStack)
    }

    private func setupTextFieldConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    @objc func textFieldEdidtingDidChange(_ textField: UITextField) {
        guard isSpacesEnabled else {
            return
        }
        let attributedString = NSMutableAttributedString(string: textField.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(8.0), range: NSRange(location: 0, length: attributedString.length))
        textField.attributedText = attributedString
    }

    @objc private func toggleSecureText() {
        if textField.isSecureTextEntry {
            textField.isSecureTextEntry = false
            showSecure.tintColor = ColorTypes.PrimaryMain500.value
        } else {
            textField.isSecureTextEntry = true
            showSecure.tintColor = ColorTypes.GrayPrimary600.value
        }
    }
}
