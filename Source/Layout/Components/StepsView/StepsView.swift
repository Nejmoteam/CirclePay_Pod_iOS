//
//  StepsView.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit
class StepsView: UIView {
    
    lazy var stepOneView: SingleStepView = {
        let stepView = SingleStepView(stepNumber: "1", stepTitle: "Info")
        stepView.translatesAutoresizingMaskIntoConstraints = false
        stepView.stepNumberLabel.backgroundColor = ColorTypes.PrimaryMain500.value
        return stepView
    }()
    
    
    lazy var stepTwoView: SingleStepView = {
        let stepView = SingleStepView(stepNumber: "2", stepTitle: "Pay")
        stepView.translatesAutoresizingMaskIntoConstraints = false
        stepView.stepNumberLabel.backgroundColor = ColorTypes.PrimaryMain200.value
        stepView.stepNumberLabel.textColor = ColorTypes.PrimaryMain700.value
        return stepView
    }()
    
    lazy var sepratorView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.PrimaryMain200.value
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStepOneView()
        self.setupStepTwoView()
        self.setupSepratorView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStepOneView() {
        self.addSubview(self.stepOneView)
        NSLayoutConstraint.activate([
            self.stepOneView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stepOneView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.stepOneView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            self.stepOneView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupStepTwoView() {
        self.addSubview(self.stepTwoView)
        NSLayoutConstraint.activate([
            self.stepTwoView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stepTwoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.stepTwoView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            self.stepTwoView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupSepratorView() {
        self.addSubview(self.sepratorView)
        NSLayoutConstraint.activate([
            self.sepratorView.leadingAnchor.constraint(equalTo: self.stepOneView.trailingAnchor, constant: 8),
            self.sepratorView.trailingAnchor.constraint(equalTo: self.stepTwoView.leadingAnchor, constant: -8),
            self.sepratorView.centerYAnchor.constraint(equalTo: self.stepOneView.centerYAnchor),
            self.sepratorView.heightAnchor.constraint(equalToConstant: 1)

        ])
    }
    
}
