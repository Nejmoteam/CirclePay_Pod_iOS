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
            return presenter.numberOfItems()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(InvoiceDetailsPaymentSammaryTableViewCell.self), for: indexPath) as? InvoiceDetailsPaymentSammaryTableViewCell ?? UITableViewCell()
            if let UnwrappedCell = cell as? InvoiceDetailsPaymentSammaryTableViewCellView {
                self.presenter.configureCell(cell: UnwrappedCell)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(InvoiceDetailsProductTableViewCell.self), for: indexPath) as? InvoiceDetailsProductTableViewCell ?? UITableViewCell()
            if let unwrappedCell = cell as? InvoiceDetailsProductTableViewCellView {
                self.presenter.configureCell(cell: unwrappedCell, at: indexPath)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.layoutIfNeeded()
        }
}
