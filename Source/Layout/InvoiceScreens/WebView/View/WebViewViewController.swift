//
//  WebViewViewController.swift
//  Pods
//
//  Created Alchemist on 31/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
import WebKit
class WebViewViewController: UIViewController, WebViewViewProtocol, WKNavigationDelegate, WKUIDelegate  {
    var presenter: WebViewPresenterProtocol!
    
    lazy var webView: WKWebView = {
        let webViewConfiguration = WKWebViewConfiguration()
        var webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
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
        button.addTarget(self, action: #selector(didTappedBack), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.setupWebView()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupWebView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.view.addSubview(self.backButton)
            NSLayoutConstraint.activate([
                self.backButton.heightAnchor.constraint(equalToConstant: 36),
                self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
                self.backButton.widthAnchor.constraint(equalToConstant: (self.view.frame.width / 2) - 48 ),
                self.backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32)
            ])
            self.view.addSubview(self.webView)
            NSLayoutConstraint.activate([
                self.webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32),
                self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
                self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
                self.webView.bottomAnchor.constraint(equalTo: self.backButton.topAnchor, constant: -32)
            ])
            if let uiConfigs = CirclePay.uiConfigs {
                if let colorString = uiConfigs.color {
                    let color = UIColor(hexString: colorString)
                    self.backButton.setTitleColor(color, for: .normal)
                    self.backButton.layer.borderColor = color.cgColor
                    self.view.showActivityIndicator(with: ._default, color: color)
                }
            }
        }
        
    }
    
    override func loadView() {
        super.loadView()
    }
    
    @objc func didTappedBack() {
        //        self.dismissAll(animated: true)
        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
    func openUrl(url: String) {
        guard let actualUrl = URL(string: url) else {
            return
        }
        self.webView.load(URLRequest(url: actualUrl))
    }
    
    func webView(_ webView: WKWebView, didFinish _: WKNavigation!) {
        self.view.removeActivityIndicator()
        print("Finish Navigation to \(webView.url?.absoluteString ?? "")")
        if let url = webView.url?.absoluteString {
            if url.contains("success=true") && url.contains("circlepay.ai") {
                print("Paid Sucsessfully")
                self.presenter.transactionPaidSucsesfully()
            } else if url.contains("success=false") && url.contains("circlepay.ai") {
                print("Couldn't Pay")
                self.presenter.failedToPayTransaction()
            }
        }
    }
    
    func webView(_: WKWebView, didFail _: WKNavigation!, withError _: Error) {
        print("fail to Navigation")
        self.view.removeActivityIndicator()
    }
    
}
