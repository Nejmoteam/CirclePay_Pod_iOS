//
//  WebViewProtocols.swift
//  Pods
//
//  Created Alchemist on 31/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol WebViewViewProtocol: class {
    var presenter: WebViewPresenterProtocol! {get set}
    func openUrl(url: String)
}
protocol WebViewPresenterProtocol {
    var view: WebViewViewProtocol? {get set}
    func viewDidLoad()
}
protocol WebViewRouterProtocol {
}
protocol WebViewInteractorInPutProtocol {
    var presenter: WebViewInteractorOutPutProtocol? {get set}
}
protocol WebViewInteractorOutPutProtocol:class {
}
