//
//  WebViewRouter.swift
//  Pods
//
//  Created Alchemist on 31/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class WebViewRouter: WebViewRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule(webViewUrl: String, transactionId: String) -> UIViewController {
        let interactor = WebViewInteractor()
        let router = WebViewRouter()
        let view = WebViewViewController()
        let presenter = WebViewPresenter(view: view, interactor: interactor, router: router, webViewUrl: webViewUrl, transactionId: transactionId)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
