//
//  CupponTextField.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit

class CupponTextField: UIView {
    lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = ColorTypes.GrayPrimary900.value
       // label.setupAlignment()
        return label
    }()

    lazy var textFieldContainerView: CirclePayTFContainer = {
        let view = CirclePayTFContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary100.value
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderColor = ColorTypes.GrayPrimary600.value.cgColor
        view.layer.borderWidth = 1
        view.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return view
    }()

    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: FontType.regularFont.name, size: 12)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = ColorTypes.Error500.value
      //  label.setupAlignment()
        label.text = "Please enter valid cuppon"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.isHidden = true
        return label
    }()

    var isInErrorMode = false {
        didSet {
            if isInErrorMode {
                self.errorLabel.isHidden = false
                self.textFieldContainerView.layer.borderColor = ColorTypes.Error700.value.cgColor
            } else {
                self.errorLabel.isHidden = true
                self.textFieldContainerView.layer.borderColor = ColorTypes.GrayPrimary600.value.cgColor
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUserInterface() {
        addSubViews()
        setupVerticalStackConstraints()
    }

    private func addSubViews() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(textFieldContainerView)
        verticalStack.addArrangedSubview(errorLabel)
    }

    private func setupVerticalStackConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

