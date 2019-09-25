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
		tableView.delegate = self
		// Don't show empty cells
		tableView.tableFooterView = UIView()
	}

	private func updateUI() {
		tableView.dataSource = dataSource
		tableView.reloadData()
	}

	private func makeDataSource() {
		let citiesDataSource = TableViewDataSource<City, CityTableViewCell>(models: country.cities.sorted(by: { $0.population > $1.population })) { (city, cell) in
			cell.textLabel?.text = city.name
			cell.detailTextLabel?.text = "Population: \(city.population) millions"
		}
		let regionsDataSource = TableViewDataSource<Region, RegionTableViewCell>(models: country.regions) { (region, cell) in
			cell.textLabel?.text = region.name
			switch region.type {
			case .agricultural:
				cell.contentView.backgroundColor = .blue
				cell.detailTextLabel?.text = "🍎"
			case .industrial:
				cell.contentView.backgroundColor = .yellow
				cell.detailTextLabel?.text = "💡"
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
