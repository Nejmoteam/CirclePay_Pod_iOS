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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.setupWebView()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupWebView() {
        self.view.addSubview(self.webView)
        NSLayoutConstraint.activate([
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    override func loadView() {
        super.loadView()
    }
    
    func openUrl(url: String) {
        guard let actualUrl = URL(string: url) else {
            return
        }
        self.webView.load(URLRequest(url: actualUrl))
    }
    
    func webView(_ webView: WKWebView, didFinish _: WKNavigation!) {
    }
    
    func webView(_: WKWebView, didFail _: WKNavigation!, withError _: Error) {
        print("fail to Navigation")
    }
}
