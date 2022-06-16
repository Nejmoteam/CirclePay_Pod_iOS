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
    static func createAnModule(webViewUrl: String, transaction: TransactionResult,invoiceViewModel: InvoiceFirstScreenViewModel) -> UIViewController {
        let interactor = WebViewInteractor()
        let router = WebViewRouter()
        let view = WebViewViewController()
        let presenter = WebViewPresenter(view: view, interactor: interactor, router: router, webViewUrl: webViewUrl, transaction: transaction, invoiceViewModel: invoiceViewModel)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func presentInvoicePaymentStatusScreen(result: InvoicePaymentStatus, invoiceViewModel: InvoiceFirstScreenViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            if ((self.viewController as? InvoicePaymentStatusNavigationDelegete) != nil) {
                let resultScene = InvoicePaymentStatusRouter.createAnModule(with: result, invoiceViewModel: invoiceViewModel, withDelegete: self.viewController)
                resultScene.modalPresentationStyle = .fullScreen
                self.viewController?.navigationController?.present(resultScene, animated: true, completion: nil)
            } else {
                let resultScene = InvoicePaymentStatusRouter.createAnModule(with: result, invoiceViewModel: invoiceViewModel, withDelegete: nil)
                resultScene.modalPresentationStyle = .fullScreen
                self.viewController?.navigationController?.present(resultScene, animated: true, completion: nil)
            }
           
        }
    }
    func userTappedTryAgainInPaymentStatus() {
        self.viewController?.navigationController?.popToViewController(ofClass: InvoiceFirstScreenViewController.self, animated: false)

    }
}

extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}
