//
//  ChildViewController.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/25/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var country: Country! {
		didSet {
			makeDataSource()
		}
	}
	var dataSource: SectionedTableViewDataSource!

	static func fromStoryboard(with country: Country) -> ChildViewController
	{
		let controller = UIStoryboard(name: "Main", bundle: nil ).instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
		controller.country = country
		return controller
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configureTableView()
		updateUI()
	}

	/// Register cells, set estimated size, etc.
	private func configureTableView() {
		CityTableViewCell.register(in: tableView)
		RegionTableViewCell.register(in: tableView)
		tableView.delegate = self
		// Don't show empty cells
		tableView.tableFooterView = UIView()
	}

	private func updateUI() {
		tableView.dataSource = dataSource
		tableView.reloadData()
	}

	private func makeDataSource() {
		let citiesDataSource = TableViewDataSource(models: country.cities, reuseIdentifier: CityTableViewCell.identifier) { (city, cell) in
			cell.textLabel?.text = city.name
			cell.detailTextLabel?.text = "Population: \(city.population) millions"
		}
		let regionsDataSource = TableViewDataSource(models: country.regions, reuseIdentifier: RegionTableViewCell.identifier) { (region, cell) in
			cell.textLabel?.text = region.name
			switch region.type {
			case .agricultural:
				cell.contentView.backgroundColor = .blue
				cell.detailTextLabel?.text = "Agriculture 🍎"
			case .industrial:
				cell.contentView.backgroundColor = .yellow
				cell.detailTextLabel?.text = "Indusrty 💡"
			}
		}
		dataSource = SectionedTableViewDataSource(dataSources: [citiesDataSource, regionsDataSource])
	}
}

extension ChildViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// handle
	}
}
