//
//  KeyValueView.swift
//  Alamofire
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit
class KeyValueView: UIView {
    
    lazy var keyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = ""
        label.textColor = ColorTypes.GrayPrimary700.value
        label.font = UIFont(name: FontType.mediumFont.name, size: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = ""
        label.textColor = ColorTypes.GrayPrimary700.value
        label.font = UIFont(name: FontType.mediumFont.name, size: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var topSeprator: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary500.value
        view.isHidden = true
        return view
    }()
    
    lazy var bottomSeprator: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary500.value
        view.isHidden = true
        return view
    }()
    
    
    init(keyTitle: String) {
        super.init(frame: .zero)
        self.keyLabel.text = keyTitle
        self.setupKeyLabel()
        self.setupValueLabel()
        self.setupSeprators()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupKeyLabel() {
        self.addSubview(self.keyLabel)
        NSLayoutConstraint.activate([
            self.keyLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.keyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.keyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            self.keyLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    
    private func setupValueLabel() {
        self.addSubview(self.valueLabel)
        NSLayoutConstraint.activate([
            self.valueLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            self.valueLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupSeprators() {
        self.addSubview(self.topSeprator)
        NSLayoutConstraint.activate([
            self.topSeprator.topAnchor.constraint(equalTo: self.topAnchor),
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
    
}

