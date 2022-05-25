//
//  InvoiceDetailsProtocols.swift
//  Pods
//
//  Created apple on 25/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol InvoiceDetailsViewProtocol: class {
    var presenter: InvoiceDetailsPresenterProtocol! {get set}
    
}
protocol InvoiceDetailsPresenterProtocol {
    var view: InvoiceDetailsViewProtocol? {get set}
    
    func viewDidLoad()
    func dismissView()
}
protocol InvoiceDetailsRouterProtocol {
    func dismissView()
}
protocol InvoiceDetailsInteractorInPutProtocol {
    var presenter: InvoiceDetailsInteractorOutPutProtocol? {get set}
}
protocol InvoiceDetailsInteractorOutPutProtocol:class {
}
