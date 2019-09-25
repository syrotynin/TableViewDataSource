//
//  ViewController.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/24/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var countriesAPI: CountriesAPI = CountriesAPIMock()
	var dataSource: TableViewDataSource<Country>!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configureTableView()
		updateUI()
	}

	/// Register cells, set estimated size, etc.
	private func configureTableView() {
		CountryTableViewCell.register(in: tableView)
		tableView.delegate = self
		// Don't show empty cells
		tableView.tableFooterView = UIView()
	}

	/// Get data from API
	private func updateUI() {
		countriesAPI.getCountries { countries in
			DispatchQueue.main.async {
				self.countriesDidLoad(countries)
			}
		}
	}

	private func countriesDidLoad(_ countries: [Country]) {
		self.dataSource = .make(for: countries)
		tableView.dataSource = dataSource
		tableView.reloadData()
	}
}

extension ViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let country = dataSource.models[indexPath.row]
		let child = ChildViewController.fromStoryboard(with: country)
		self.navigationController?.pushViewController(child, animated: true)
	}
}

extension TableViewDataSource where Model == Country {
	static func make(for countries: [Country],
					 reuseIdentifier: String = CountryTableViewCell.identifier) -> TableViewDataSource {
		return TableViewDataSource(
			models: countries,
			reuseIdentifier: reuseIdentifier
		) { (country, cell) in
			cell.textLabel?.text = country.name
			cell.detailTextLabel?.text = "\(country.cities.count) cities & \(country.regions.count) regions"
		}
	}
}
