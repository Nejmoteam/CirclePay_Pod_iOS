//
//  InvoiceDetailContainerView + UItableView.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 25/05/2022.
//

import Foundation
import UIKit

extension InvoiceDetailsContainerView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(InvoiceDetailsPaymentSammaryTableViewCell.self), for: indexPath) as? InvoiceDetailsPaymentSammaryTableViewCell ?? UITableViewCell()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(InvoiceDetailsProductTableViewCell.self), for: indexPath) as? InvoiceDetailsProductTableViewCell ?? UITableViewCell()
            return cell
        }
    }
}
