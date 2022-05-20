//
//  SingleStepView.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit

class SingleStepView: UIView {
    lazy var stepNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.text = ""
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var stepTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.text = ""
        label.backgroundColor = .clear
        return label
    }()
    
    init(stepNumber: String, stepTitle: String) {
        super.init(frame: .zero)
        self.stepNumberLabel.text = stepNumber
        self.stepTitleLabel.text = stepTitle
        self.setupStepNumberLabel()
        self.setupStepTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStepNumberLabel() {
        self.addSubview(self.stepNumberLabel)
        NSLayoutConstraint.activate([
            self.stepNumberLabel.heightAnchor.constraint(equalToConstant: 24),
            self.stepNumberLabel.widthAnchor.constraint(equalToConstant: 24),
            self.stepNumberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.stepNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        self.stepNumberLabel.layer.cornerRadius = 12
        self.stepNumberLabel.clipsToBounds = true
    }
    
    private func setupStepTitleLabel() {
        self.addSubview(self.stepTitleLabel)
        NSLayoutConstraint.activate([
            self.stepTitleLabel.heightAnchor.constraint(equalToConstant: 24),
            self.stepTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.stepTitleLabel.leadingAnchor.constraint(equalTo: self.stepNumberLabel.trailingAnchor, constant: 6)
        ])
    }
}

