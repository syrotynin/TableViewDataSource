//
//  UITableView+Header.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/27/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

extension UITableView {

	/// Displays HeaderView message in tableView
	func showHeaderMessage(with text: String) {
		let header: HeaderMessageView = HeaderMessageView.fromNib()
		header.configure(with: text)

		tableHeaderView = header
		sizeTableHeaderToFit()
	}

	func hideMessage() {
		tableHeaderView = nil
	}

	func sizeTableHeaderToFit()
	{
		if let headerView = tableHeaderView {
			headerView.setNeedsLayout()
			headerView.layoutIfNeeded()

			let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
			var frame = headerView.frame
			frame.size.height = height
			headerView.frame = frame

			tableHeaderView = headerView
		}
	}
}
