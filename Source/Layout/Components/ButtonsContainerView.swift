//
//  ButtonsContainerView.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit

class ButtonsContainerView: UIView {
    
    lazy var hStackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 32
        return stack
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pay", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.mediumFont.name, size: 18)
        button.backgroundColor = ColorTypes.PrimaryMain500.value
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        //        button.addTarget(self, action: #selector(userPressedContinue), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.regularFont.name, size: 18)
        button.backgroundColor = .white
        button.setTitleColor(ColorTypes.PrimaryMain500.value, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = ColorTypes.PrimaryMain500.value.cgColor
        //        button.addTarget(self, action: #selector(userPressedContinue), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStackView()
       // self.setupNextButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupStackView() {
        self.addSubview(self.hStackView)
        NSLayoutConstraint.activate([
            self.hStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -61),
            self.hStackView.heightAnchor.constraint(equalToConstant: 36),
            self.hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ])
        self.hStackView.addArrangedSubview(self.backButton)
        self.hStackView.addArrangedSubview(self.nextButton)

    }
    func setupNextButton() {
        self.addSubview(self.nextButton)
        NSLayoutConstraint.activate([
            self.nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -61),
            self.nextButton.heightAnchor.constraint(equalToConstant: 36),
            self.nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ])
    }
}


