//
//  CountryPerfixPicker.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 29/05/2022.
//

import Foundation
import UIKit

protocol CountryPrefixPickerDelegate: AnyObject {
    func didSelectCountry(country: CountriesISO3166)
}

class CountryPrefixPicker: UIView, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary0.value
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()

    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.delegate = self
        bar.placeholder = "Search Country"
        bar.backgroundColor = .clear
        return bar
    }()

    lazy var cancleBTN: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(ColorTypes.PrimaryMain500.value, for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.mediumFont.name, size: 14)
        button.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        return button
    }()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()

    weak var delegate: CountryPrefixPickerDelegate?
    var fillteredCountries = CountriesISO3166.allCases

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUserInterface()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterface() {
        addSubviews()
        setupContainerViewConstraints()
        setupSearchBarConstraints()
        setupCancleBTNConstraints()
        setupTableViewConstraints()
    }

    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(searchBar)
        containerView.addSubview(cancleBTN)
        containerView.addSubview(tableView)
    }

    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    private func setupSearchBarConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            searchBar.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setupCancleBTNConstraints() {
        NSLayoutConstraint.activate([
            cancleBTN.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 8),
            cancleBTN.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            cancleBTN.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor)
        ])
    }

    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }

    func searchBar(_: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            if searchText.isEmpty {
                self.fillteredCountries = CountriesISO3166.allCases
            } else {
                self.fillteredCountries = CountriesISO3166.allCases.filter {
                    $0.country.hasPrefix(searchText)
                }
            }
            self.tableView.reloadData()
        }
    }

    func searchBarSearchButtonClicked(_: UISearchBar) {
        self.endEditing(true)
    }

    func searchBarShouldEndEditing(_: UISearchBar) -> Bool {
        self.endEditing(true)
        return true
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        fillteredCountries.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = fillteredCountries[indexPath.row].flag +
            " " + fillteredCountries[indexPath.row].country
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont(name: FontType.regularFont.name, size: 16)
        cell.textLabel?.sizeToFit()
        return cell
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else {
                return
            }
            self.delegate?.didSelectCountry(country: self.fillteredCountries[indexPath.row])
            self.removeFromSuperview()
        }
    }

    @objc private func removeView() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else {
                return
            }
            self.removeFromSuperview()
        }
    }
}
