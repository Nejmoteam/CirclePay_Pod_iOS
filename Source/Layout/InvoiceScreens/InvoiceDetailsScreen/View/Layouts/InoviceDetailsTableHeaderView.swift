//
//  TableHeaderView.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 25/05/2022.
//

import Foundation
import UIKit

class InoviceDetailsTableHeaderView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = ColorTypes.PrimaryMain700.value
        label.text = "Payment Summery"
        label.font = UIFont(name: FontType.mediumFont.name, size: 20)
        return label
    }()
    
    lazy var closeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Close",
                                in: Bundle(for: type(of:self)),
                                compatibleWith: nil), for: .normal)
        button.imageView?.contentMode = .center
        button.addTarget(self, action: #selector(closeButtonTarget), for: .touchUpInside)
        return button
    }()
    
    var onCloseButtonClick: (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterface() {
        addSubviews()
        setupTitleLabel()
        setupCloseButton()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(closeButton)
    }
    
    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }
    
    private func setupCloseButton() {
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
    
    @objc private func closeButtonTarget() {
        self.onCloseButtonClick?()
    }
}
