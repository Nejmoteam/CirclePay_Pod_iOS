//
//  InvoiceFirstScreenProtocols.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol InvoiceFirstScreenViewProtocol: class {
    var presenter: InvoiceFirstScreenPresenterProtocol! {get set}
}
protocol InvoiceFirstScreenPresenterProtocol {
    var view: InvoiceFirstScreenViewProtocol? {get set}
    func viewDidLoad()
}
protocol InvoiceFirstScreenRouterProtocol {
}
protocol InvoiceFirstScreenInteractorInPutProtocol {
    var presenter: InvoiceFirstScreenInteractorOutPutProtocol? {get set}
}
protocol InvoiceFirstScreenInteractorOutPutProtocol:class {
}
