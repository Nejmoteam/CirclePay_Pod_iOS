//
//  PaymentBaseClass.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 19/05/2022.
//

import Foundation
import UIKit

class PaymentBaseClass: UIView {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 1
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        self.addSubViews()
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupVStackViewConstraints()
    }
    private func addSubViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vStackView)
    }
    
    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1)
        ])
    }
    
    private func setupVStackViewConstraints() {
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            vStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            vStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
