//
//  ButtonsContainerView.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit

class ButtonsContainerView: UIView {
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = ColorTypes.PrimaryMain500.value
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        //        button.addTarget(self, action: #selector(userPressedContinue), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNextButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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


