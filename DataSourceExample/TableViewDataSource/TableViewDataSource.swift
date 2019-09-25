//
//  TableViewDataSource.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/24/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

class TableViewDataSource<Model, Cell: ReusableTableCell>: NSObject, UITableViewDataSource {
	typealias CellConfigurator = (Model, Cell) -> Void

	let models: [Model]

	private let cellConfigurator: CellConfigurator

	init(models: [Model], _ cellConfigurator: @escaping CellConfigurator) {
		self.models = models
		self.cellConfigurator = cellConfigurator
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return models.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = models[indexPath.row]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else {
			assertionFailure("Cell configuration failed")
			return UITableViewCell()
		}

		cellConfigurator(model, cell)

		return cell
	}
}
