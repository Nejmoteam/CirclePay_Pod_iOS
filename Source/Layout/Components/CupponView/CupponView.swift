//
//  CupponView.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit
class CupponView: UIView {
    
    lazy var topSeprator: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary500.value
        return view
    }()
    
    lazy var bottomSeprator: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary500.value
        return view
    }()
    
    lazy var CodeTF: CupponTextField = {
        let view = CupponTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = "Cuppon Code"
        view.textFieldContainerView.textField.placeholder = "_   _   _   _   _   _"
        view.textFieldContainerView.textField.textContentType = .oneTimeCode
        view.textFieldContainerView.textField.keyboardType = .numberPad
        view.textFieldContainerView.isSpacesEnabled = true
        view.textFieldContainerView.showSecure.isHidden = true
        return view
    }()
    
    lazy var applyCupponButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = ColorTypes.PrimaryMain500.value
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Apply Cuppon", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.sizeToFit()
        //        button.addTarget(self, action: #selector(didTappedApply), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSeprators()
        self.setupCodeTF()
        self.setupApplyButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSeprators() {
        self.addSubview(self.topSeprator)
        NSLayoutConstraint.activate([
            self.topSeprator.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.topSeprator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.topSeprator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.topSeprator.heightAnchor.constraint(equalToConstant: 1)
            
        ])
        
        self.addSubview(self.bottomSeprator)
        NSLayoutConstraint.activate([
            self.bottomSeprator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.bottomSeprator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.bottomSeprator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.bottomSeprator.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    private func setupCodeTF() {
        self.addSubview(self.CodeTF)
        NSLayoutConstraint.activate([
            self.CodeTF.topAnchor.constraint(equalTo: self.topAnchor, constant: 21),
            self.CodeTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            
            self.CodeTF.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.CodeTF.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.55)
            
        ])
        self.CodeTF.isInErrorMode = true
        self.CodeTF.errorLabel.text = "Please Enter Valid Code!"
    }
    
    private func setupApplyButton() {
        self.addSubview(self.applyCupponButton)
        NSLayoutConstraint.activate([
            self.applyCupponButton.leadingAnchor.constraint(equalTo: self.CodeTF.trailingAnchor, constant: 12),
            self.applyCupponButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.applyCupponButton.heightAnchor.constraint(equalToConstant: 36),
            self.applyCupponButton.centerYAnchor.constraint(equalTo: self.CodeTF.textFieldContainerView.textField.centerYAnchor),
            
        ])
    }
    
}
